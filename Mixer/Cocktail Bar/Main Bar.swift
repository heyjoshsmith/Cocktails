//
//  Main Bar.swift
//  Mixer
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI
import CoreData
#if canImport(WidgetKit)
import WidgetKit
#endif

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
    
    
    
    // Stored Properties
    
    @AppStorage("Spotlight Indexed") var spotlightIndexed: Bool = false
    @AppStorage("Hidden Ingredients") var hiddenIngredients = [IngredientType]()
    
    @Published var selectedCocktail: [Cocktail] = []
    @Published var filter: Filter = .none
    @Published var search = ""
    
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
    
    
    
    // Main Functions
    
    func save() {
        do {
            try container.viewContext.save()
            reloadWidgets()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func reloadWidgets() {
        #if !os(xrOS)
        WidgetCenter.shared.reloadAllTimelines()
        #endif
    }
    
    
    
    // Additional Info
    
    func filterIncludes(_ category: CocktailCategory) -> Bool {
        
        let categoryNumbers = Set(category.recipes.map { $0.number })
        
        switch filter {
        case .liked:
            return categoryNumbers.contains { cocktail in
                likes.contains(cocktail)
            }
        case .disliked:
            return categoryNumbers.contains { cocktail in
                dislikes.contains(cocktail)
            }
        case .notRated:
            return categoryNumbers.contains { cocktail in
                !likes.contains(cocktail) && !dislikes.contains(cocktail)
            }
        case .ingredient(let type):
            return Array(category.recipes.map { cocktail in
                cocktail.ingredients.map { ingredient in
                    ingredient.kind
                }
            }.joined()).contains(type)
        default:
            return true
        }
        
    }
    
    func searchInclude(_ category: CocktailCategory) -> Bool {
        
        if search.isEmpty {
            return true
        } else {
            
            let categoryMatchesSearch = category.name.lowercased().contains(search.lowercased())
            
            var cocktailsMatchSearch: Bool {
                let cocktailNames = category.recipes.map { cocktail in
                    cocktail.name.lowercased()
                }
                let matches = cocktailNames.filter { cocktail in
                    cocktail.contains(search.lowercased())
                }
                return !matches.isEmpty
            }
            
            var ingredientsMatchSearch: Bool {
                
                let ingredientList = Set(category.recipes.map { cocktail in
                    cocktail.ingredients.map { ingredient in
                        ingredient.name.lowercased()
                    }
                }.joined())
                
                return ingredientList.map { ingredient in
                    ingredient.contains(search.lowercased())
                }.contains(true)
            
            }
            
            return categoryMatchesSearch || cocktailsMatchSearch || ingredientsMatchSearch
            
        }
        
    }
    
}

enum Device {
    case iPhone, iPad, watch, mac, tv
}
