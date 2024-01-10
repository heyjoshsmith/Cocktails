//
//  Bar Spotlight.swift
//  Cocktails
//
//  Created by Josh Smith on 9/12/22.
//

import Foundation
import CoreSpotlight

extension Bar {
    
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
        let attributes = CSSearchableItemAttributeSet(itemContentType: "com.heyjoshsmith.Cocktails")
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
    
}
