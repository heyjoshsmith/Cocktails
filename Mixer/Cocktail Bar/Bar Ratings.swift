//
//  Bar Ratings.swift
//  Mixer
//
//  Created by Josh Smith on 9/12/22.
//

import Foundation
import CoreData

extension Bar {
    
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
    
    func deleteRatings() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Rating.fetchRequest()
            delete(fetchRequest)
    }
    
    
    
    // Private Functions
    
    private func delete(_ fetchRequest: NSFetchRequest<NSFetchRequestResult>) {
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest1.resultType = .resultTypeObjectIDs

        if let delete = try? Bar.shared.container.viewContext.execute(batchDeleteRequest1) as? NSBatchDeleteResult {
            let changes = [NSDeletedObjectsKey: delete.result as? [NSManagedObjectID] ?? []]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [Bar.shared.container.viewContext])
        }
    }
    
}
