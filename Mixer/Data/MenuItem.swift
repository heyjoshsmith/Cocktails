//
//  MenuItem.swift
//  Mixer
//
//  Created by Josh Smith on 9/7/22.
//

import Foundation

struct MenuItem: Codable, Identifiable, Equatable {
    
    var name: String
    var count: Int
    var ingredients: [Ingredient]
    
    init(_ cocktail: Cocktail, count: Int) {
        self.name = cocktail.name
        self.count = count
        self.ingredients = cocktail.ingredients
    }
    
    var id: String {
        return name
    }
    
    var scaledIngredients: [Ingredient] {
        return ingredients.map { Ingredient($0.kind, amount: ($0.value.value * Double(count)))}
    }
    
    var cocktail: Cocktail {
        return Cocktail(name)
    }
    
}
