//
//  Rating.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 8/23/22.
//

import SwiftUI

extension Rating {
    
    var cocktail: Int {
        get {
            return Int(cocktailNumber)
        }
        set {
            self.cocktailNumber = Int16(newValue)
        }
    }
    
    func toggle() {
        liked = !liked
    }
    
}

enum RatingType: CaseIterable {
    
    case liked, disliked, none
    
    var name: String {
        switch self {
        case .liked:
            return "Liked"
        case .disliked:
            return "Disliked"
        case .none:
            return "None"
        }
    }
    
    var action: String {
        switch self {
        case .liked:
            return "Like"
        case .disliked:
            return "Dislike"
        case .none:
            return "No Rating"
        }
    }
    
    var icon: String {
        switch self {
        case .liked:
            return "hand.thumbsup"
        case .disliked:
            return "hand.thumbsdown"
        case .none:
            return "questionmark.app.dashed"
        }
    }
    
    var color: Color {
        switch self {
        case .liked:
            return .green
        case .disliked:
            return .red
        case .none:
            return .blue
        }
    }
    
    var filter: Filter {
        switch self {
        case .liked:
            return .liked
        case .disliked:
            return .disliked
        case .none:
            return .notRated
        }
    }
    
}
