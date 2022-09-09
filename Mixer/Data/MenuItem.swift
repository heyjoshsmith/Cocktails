//
//  MenuItem.swift
//  Mixer
//
//  Created by Josh Smith on 9/7/22.
//

import Foundation

struct MenuItem: Codable, Hashable, Identifiable {
    var cocktail: Cocktail
    var count: Int
    
    init(_ cocktail: Cocktail, count: Int) {
        self.cocktail = cocktail
        self.count = count
    }
    
    var id: Self {
        return self
    }
    
    var scaledIngredients: [Ingredient] {
        return cocktail.ingredients.map { Ingredient($0.kind, amount: ($0.value.value * Double(count)))}
    }
}
