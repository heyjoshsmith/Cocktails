//
//  Filter.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 8/23/22.
//

import SwiftUI

enum Filter: Int, CaseIterable {
    case none, liked, disliked, notRated
    
    static var ratings: [Filter] = [.liked, .disliked, .notRated]
    
    var name: String {
        switch self {
        case .none:
            return "None"
        case .liked:
            return "Liked"
        case .disliked:
            return "Disliked"
        case .notRated:
            return "Not Rated"
        }
    }
    
    var icon: String {
        switch self {
        case .none:
            return "xmark.circle"
        case .liked:
            return "hand.thumbsup"
        case .disliked:
            return "hand.thumbsdown"
        case .notRated:
            return "questionmark.app.dashed"
        }
    }
    
    var keyboardShortcut: KeyboardShortcut {
        switch self {
        case .none:
            return KeyboardShortcut("0")
        case .liked:
            return KeyboardShortcut("1")
        case .disliked:
            return KeyboardShortcut("2")
        case .notRated:
            return KeyboardShortcut("3")
        }
    }
    
}
