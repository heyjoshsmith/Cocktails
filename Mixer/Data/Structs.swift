//
//  Structs.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import SwiftUI

struct Ingredient: Hashable, Identifiable {
    
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
                return formatter.string(from: value)
            }
        default:
            return formatter.string(from: value)
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
                return formatter.string(from: value * Double(amount))
            }
        default:
            return formatter.string(from: value * Double(amount))
        }
    }
    
    init(_ kind: IngredientType, amount: Double) {
        self.kind = kind
        self.amount = amount
    }
    
}

struct Cocktail: Hashable, Identifiable, Equatable {
    
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
    
    // sorting

    static func < (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.number < rhs.number
    }

    static func > (lhs: Cocktail, rhs: Cocktail) -> Bool {
        lhs.number > rhs.number
    }
    
    static func == (lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func example(of name: String) -> Cocktail {
        
        let result = cocktails.filter { cocktail in
            cocktail.name == name
        }.first
        
        return result ?? cocktails[0]
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