//
//  Structs.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import SwiftUI

struct Ingredient: Codable, Hashable, Identifiable {
    
    var id = UUID()
    
    var kind: IngredientType
    var amount: Double
    
    var name: String {
        return kind.name
    }
    
    var value: Measurement<Unit> {
        return Measurement(value: amount, unit: kind.units)
    }
    
    var measurement: String {
        
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit

        switch kind.units {
        case UnitGarnish.garnish:
            return "Garnish"
        case UnitFill.fill:
            return "Top Off"
        case UnitNone.none:
            return ""
        case UnitVolume.fluidOunces:
            if amount == 0 {
                return "Top Off"
            } else {
                return formatter.string(from: value).asFraction
            }
        default:
            return formatter.string(from: value).asFraction
        }
    }
    
    func measurement(for amount: Int) -> String {
        
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit

        switch kind.units {
        case UnitGarnish.garnish:
            return "Garnish"
        case UnitFill.fill:
            return "Top Off"
        case UnitNone.none:
            return ""
        case UnitVolume.fluidOunces:
            if value.value == 0 {
                return "Top Off"
            } else {
                return formatter.string(from: value * Double(amount)).asFraction
            }
        default:
            return formatter.string(from: value * Double(amount)).asFraction
        }
    }
    
    init(_ kind: IngredientType, amount: Double) {
        self.kind = kind
        self.amount = amount
    }
    
    static func < (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.kind.name < rhs.kind.name
    }
    
}

struct Cocktail: Codable, Hashable, Identifiable, Equatable {
    
    var id: Self { self }
    
    var number: Int
    var category: CocktailCategory
    var name: String
    var flavorProfile: String
    var history: String
    
    var ingredients: [Ingredient]
    
    var instructions: [String]
    
    var supplies: [Item]
    
    var tip: String
    
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
    
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    init(_ name: String) {
        let result = cocktails.filter { cocktail in
            cocktail.name.lowercased() == name.lowercased()
        }.first
        
        self = result ?? cocktails[0]
    }
    
    init(
        number: Int, category: CocktailCategory, name: String,
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

extension [MenuItem] {
    
    func ingredientList(_ includeGarnish: Bool? = false) -> [Ingredient] {
        
        let fullIngredients = Set(self.map { $0.scaledIngredients }.joined())
        var mergedIngredients = [Ingredient]()
        
        for ingredient in fullIngredients {
            if !(mergedIngredients.map { $0.kind }).contains(ingredient.kind) {
                let matches = fullIngredients.filter { match in
                    match.kind == ingredient.kind
                }
                let total = matches.map { $0.value.value }.reduce(0, +)
                let merged = Ingredient(ingredient.kind, amount: total)
                mergedIngredients.append(merged)
            }
        }
        
        var filtered: [Ingredient] {
            if includeGarnish! {
                return mergedIngredients
            } else {
                return mergedIngredients.filter { ingredient in
                    ingredient.value.unit != UnitGarnish.garnish
                }
            }
        }
        
        return filtered.sorted(by: <)
        
    }
    
    func ingredientTypeList(_ includeGarnish: Bool? = false) -> [IngredientType] {
        
        let original = Set(self.map { $0.cocktail.ingredients.map { $0.kind }}.joined())
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
        
        let original = Set(self.map { $0.cocktail.ingredients.map { $0.kind }}.joined())
        var filtered: Set<IngredientType> {
            return original.filter { ingredient in
                ingredient.units == UnitGarnish.garnish
            }
        }
        let array = Array<IngredientType>(filtered).sorted(by: <)
        return array
    }
    
}

struct Crop {
    
    var squareX: CGFloat?
    var squareY: CGFloat?
    
    var heroX: CGFloat?
    var heroY: CGFloat?
    
}


struct PlainNavigationLinkButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    PlainNavigationLinkButton(configuration: configuration)
  }
}

struct PlainNavigationLinkButton: View {
  @Environment(\.isFocused) var focused: Bool
  let configuration: ButtonStyle.Configuration

  var body: some View {
    configuration.label
      .scaleEffect(focused ? 1.1 : 1)
      #if os(tvOS)
      .focusable(true)
      #endif
      .animation(.default, value: focused)
  }
}

struct HighlightNavigationLinkButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
      HighlightNavigationLinkButton(configuration: configuration)
  }
}

struct HighlightNavigationLinkButton: View {
  @Environment(\.isFocused) var focused: Bool
  let configuration: ButtonStyle.Configuration

  var body: some View {
      configuration.label
        .scaleEffect(focused ? 1.05 : 1)
        #if os(tvOS)
        .focusable(true)
        #endif
        .animation(.default, value: focused)
  }
}

struct TVButtonStyle: ButtonStyle {
    var color: Color?
    var mac: Bool
    func makeBody(configuration: Self.Configuration) -> some View {
        TVButton(configuration: configuration, color: color, mac: mac)
    }
}

struct TVButton: View {
  @Environment(\.isFocused) var focused: Bool
  let configuration: ButtonStyle.Configuration
    var color: Color?
    var mac: Bool

  var body: some View {
      configuration.label
        .padding(mac ? 15 : 25)
        .foregroundColor(focused ? .black : .white)
        .background(color ?? (focused ? .white : .clear))
        .background(.ultraThinMaterial)
        .clipShape(Circle())
        #if os(tvOS)
        .focusable(true)
        #endif
        .animation(.default, value: focused)
  }
}
