//
//  Cocktail.swift
//  Cocktails
//
//  Created by Josh Smith on 12/28/23.
//

import SwiftUI
import SwiftData

@Model final class Cocktail: Codable {
    
    var number: Int
    var category: CocktailCategory
    var name: String
    var flavorProfile: String
    var history: String
    var ingredients: [Ingredient]
    var instructions: [String]
    var supplies: [Item]
    var tip: String

    enum CodingKeys: String, CodingKey {
        case number
        case category
        case name
        case flavorProfile
        case history
        case ingredients
        case instructions
        case supplies
        case tip
    }

    init(
        number: Int,
        category: CocktailCategory,
        name: String,
        flavorProfile: String,
        history: String,
        ingredients: [Ingredient],
        instructions: [String],
        supplies: [Item],
        tip: String
    ) {
        self.number = number
        self.category = category
        self.name = name
        self.flavorProfile = flavorProfile
        self.history = history
        self.ingredients = ingredients
        self.instructions = instructions
        self.supplies = supplies
        self.tip = tip
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        self.category = try container.decode(CocktailCategory.self, forKey: .category)
        self.name = try container.decode(String.self, forKey: .name)
        self.flavorProfile = try container.decode(String.self, forKey: .flavorProfile)
        self.history = try container.decode(String.self, forKey: .history)
        self.ingredients = try container.decode([Ingredient].self, forKey: .ingredients)
        self.instructions = try container.decode([String].self, forKey: .instructions)
        self.supplies = try container.decode([Item].self, forKey: .supplies)
        self.tip = try container.decode(String.self, forKey: .tip)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(category, forKey: .category)
        try container.encode(name, forKey: .name)
        try container.encode(flavorProfile, forKey: .flavorProfile)
        try container.encode(history, forKey: .history)
        try container.encode(ingredients, forKey: .ingredients)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(supplies, forKey: .supplies)
        try container.encode(tip, forKey: .tip)
    }
    
    func heroImage(width: CGFloat? = nil, height: CGFloat, alignment: Alignment? = nil) -> some View {
        return Image("\(name)-Hero")
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height, alignment: alignment ?? .center)
            .clipped()
    }
    
    func squareImage(size: CGFloat) -> some View {
        return Image("\(name)-Square")
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size, alignment: .center)
    }
    
    func circleImage(size: CGFloat) -> some View {
        return Image("\(name)-Square")
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .clipShape(.circle)
    }
    
    var imageData: Data {
        return UIImage(named: "\(name)-Square")?.jpegData(compressionQuality: 0.5) ?? Data()
    }
    
    // sorting
    
    static func < (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.number < rhs.number
    }
    
    static func > (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.number > rhs.number
    }
    
    static func aToZ (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.name < rhs.name
    }
    
    static func zToA (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.name > rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    init(_ name: String) {
        let result = cocktails.filter { cocktail in
            cocktail.name.lowercased() == name.lowercased()
        }.first ?? cocktails[0]
        
        self.number = result.number
        self.category = result.category
        self.name = result.name
        self.flavorProfile = result.flavorProfile
        self.history = result.history
        
        self.ingredients = result.ingredients
        
        self.instructions = result.instructions
        
        self.supplies = result.supplies
        
        self.tip = result.tip
        
    }
    
    static func example(of name: String) -> Cocktail {
        
        let result = cocktails.filter { cocktail in
            cocktail.name == name
        }.first
        
        return result ?? cocktails[0]
    }
    
    static func random(_ range: ClosedRange<Int>) -> [Cocktail] {
        
        var examples = [Cocktail]()
        let number = range.randomElement() ?? 0
        
        for _ in 1...number {
            let remaining = cocktails.filter { cocktail in
                !examples.contains(cocktail)
            }
            let example = remaining.randomElement()!
            examples.append(example)
        }
        
        return examples
        
    }
    
    static var random: Cocktail {
        return random(1...50).randomElement() ?? Cocktail("Martini")
    }
    
    var url: URL {
        print("COMMENT (): \(name)")
        return URL(string: "cocktails://\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")!
    }
    
}



typealias Cocktails = [Cocktail]
extension Cocktails {
    
    func ingredientList(_ includeGarnish: Bool? = false) -> [IngredientType] {
        
        let original = Set(self.map { $0.ingredients.map { $0.kind }}.joined())
        var filtered: Set<IngredientType> {
            if includeGarnish! {
                return original
            } else {
                return original.filter { ingredient in
                    ingredient.units != UnitGarnish.garnish
                }
            }
        }
        let array = Array<IngredientType>(filtered).sorted(by: <)
        return array
    }
    
    var garnishes: [IngredientType] {
        
        let original = Set(self.map { $0.ingredients.map { $0.kind }}.joined())
        var filtered: Set<IngredientType> {
            return original.filter { ingredient in
                ingredient.units == UnitGarnish.garnish
            }
        }
        let array = Array<IngredientType>(filtered).sorted(by: <)
        return array
    }
    
}
