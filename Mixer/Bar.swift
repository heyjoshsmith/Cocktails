//
//  Persistence.swift
//  Mixer
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI
import CoreData
import CoreSpotlight

class Bar: ObservableObject {

    let container: NSPersistentCloudKitContainer
    public static let shared = Bar()
    
    init(inMemory: Bool = false) {
        
        container = NSPersistentCloudKitContainer(name: "Mixer")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        } else {
            let groupID = "group.com.heyjoshsmith.Mixer"

            if let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID) {
                container.persistentStoreDescriptions.first?.url = url.appendingPathComponent("Mixer.sqlite")
            }
        }
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }

            self.container.viewContext.automaticallyMergesChangesFromParent = true

        }
        
    }

    static var preview: Bar = {
        let result = Bar(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {

        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    func save() {
        do {
            try container.viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteRatings() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Rating.fetchRequest()
            delete(fetchRequest)
    }
    
    private func delete(_ fetchRequest: NSFetchRequest<NSFetchRequestResult>) {
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest1.resultType = .resultTypeObjectIDs

        if let delete = try? Bar.shared.container.viewContext.execute(batchDeleteRequest1) as? NSBatchDeleteResult {
            let changes = [NSDeletedObjectsKey: delete.result as? [NSManagedObjectID] ?? []]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [Bar.shared.container.viewContext])
        }
    }
    
    func loadSearch() {
        
        var items: [CSSearchableItem] = []
        
        if !spotlightIndexed {
            for cocktail in cocktails {
                let item = index(cocktail)
                print("COMMENT (Load Search): \(item.attributeSet.path ?? "N/A")")
                items.append(item)
            }
            spotlightIndexed = true
        }
        
        if !items.isEmpty {
            CSSearchableIndex.default().indexSearchableItems(items, completionHandler: { error in
              if let error = error {
                  print("DEBUG (Load Search): \(error.localizedDescription)")
              }
            })
            print("COMMENT (Load Search): Successfully added Spotlight items.")
        }
    }
    
    func attributeSet(_ cocktail: Cocktail) -> CSSearchableItemAttributeSet {
        let attributes = CSSearchableItemAttributeSet(itemContentType: "com.heyjoshsmith.Mixer")
        attributes.title = cocktail.name
        attributes.contentType = cocktail.name
        attributes.contentDescription = cocktail.flavorProfile
        attributes.keywords = cocktail.ingredients.map { $0.name }
        attributes.identifier = cocktail.name
        attributes.relatedUniqueIdentifier = cocktail.name
        attributes.thumbnailData = cocktail.imageData
        attributes.path = "cocktails://\(cocktail.name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")"

        return attributes
    }
    
    func index(_ cocktail: Cocktail) -> CSSearchableItem {
        return CSSearchableItem(uniqueIdentifier: cocktail.name, domainIdentifier: "cocktails", attributeSet: attributeSet(cocktail))
    }
    
    var device: Device {
        
        #if os(iOS)
        let type = UIDevice.current.userInterfaceIdiom
        
        switch type {
        case .pad: return .iPad
        default: return .iPhone
        }
        
        #elseif os(macOS)
        return .mac
        #elseif os(tvOS)
        return .tv
        #else
        return .watch
        #endif
        
    }
    
    @AppStorage("Spotlight Indexed") var spotlightIndexed: Bool = false
    @AppStorage("Hidden Ingredients") var hiddenIngredients = [IngredientType]()
    
    @Published var selectedCocktail: [Cocktail] = []
    @Published var filter: Filter = .none
    @Published var search = ""
    
    
    var liked: [Rating] {
        let itemRequest: NSFetchRequest<Rating> = Rating.fetchRequest()

        let filter = NSPredicate(format: "liked == %@", NSNumber(value: true))
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [filter])
        itemRequest.predicate = compoundPredicate

        itemRequest.sortDescriptors = [
            NSSortDescriptor(keyPath: \Rating.cocktailNumber, ascending: true)
        ]

        return (try? Bar.shared.container.viewContext.fetch(itemRequest)) ?? []
    }
    
    var likes: [Int] {
        return liked.map { $0.cocktail }
    }
    
    var disliked: [Rating] {
        let itemRequest: NSFetchRequest<Rating> = Rating.fetchRequest()

        let filter = NSPredicate(format: "liked == NO")
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [filter])
        itemRequest.predicate = compoundPredicate

        itemRequest.sortDescriptors = [
            NSSortDescriptor(keyPath: \Rating.cocktailNumber, ascending: true)
        ]

        return (try? Bar.shared.container.viewContext.fetch(itemRequest)) ?? []
    }
    
    var dislikes: [Int] {
        return disliked.map { $0.cocktail }
    }
    
    func rate(_ cocktail: Cocktail, rating: RatingType) {

        let likedCocktail = liked.first { rating in
            rating.cocktail == cocktail.number
        }

        let dislikedCocktail = disliked.first { rating in
            rating.cocktail == cocktail.number
        }

        if let likedCocktail {
            switch rating {
            case .liked:
                likedCocktail.liked = true
            case .disliked:
                likedCocktail.liked = false
            case .none:
                container.viewContext.delete(likedCocktail)
            }
        } else if let dislikedCocktail {
            switch rating {
            case .liked:
                dislikedCocktail.liked = false
            case .disliked:
                dislikedCocktail.liked = true
            case .none:
                container.viewContext.delete(dislikedCocktail)
            }
        } else {
            let newCocktail = Rating(context: container.viewContext)
            newCocktail.cocktail = cocktail.number
            switch rating {
            case .liked:
                newCocktail.liked = true
            case .disliked:
                newCocktail.liked = false
            default:
                print("Comment (Rate): Deleting rating for \(cocktail.number).")
            }
        }

        save()

    }
    
}

enum Device {
    case iPhone, iPad, watch, mac, tv
}
