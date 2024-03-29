//
//  Filter.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 8/23/22.
//

import SwiftUI

enum Filter: Equatable, Hashable {
    
    case liked, disliked, notRated, ingredient(_ type: IngredientType)
        
    var name: String {
        switch self {
        case .liked:
            return "Liked"
        case .disliked:
            return "Disliked"
        case .notRated:
            return "Not Rated"
        case .ingredient(let type):
            return type.name
        }
    }
    
    var icon: String {
        switch self {
        case .liked:
            return "hand.thumbsup"
        case .disliked:
            return "hand.thumbsdown"
        case .notRated:
            return "questionmark.app.dashed"
        case .ingredient(_):
            return "drop.fill"
        }
    }
    
    #if os(macOS)
    var keyboardShortcut: KeyboardShortcut {
        switch self {
        case .liked:
            return KeyboardShortcut("1")
        case .disliked:
            return KeyboardShortcut("2")
        case .notRated:
            return KeyboardShortcut("3")
        case .ingredient(_):
            return KeyboardShortcut("i")
        }
    }
    #endif
    
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        lhs.name == rhs.name
    }
    
}
