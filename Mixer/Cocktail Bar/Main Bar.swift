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
    
    public static let shared = Bar()
    
    
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
    
    func reloadWidgets() {
        #if !os(visionOS)
        WidgetCenter.shared.reloadAllTimelines()
        #endif
    }
    
    
    
    // Additional Info
    
    func filterIncludes(_ category: CocktailCategory) -> Bool {
                
        switch filter {
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
