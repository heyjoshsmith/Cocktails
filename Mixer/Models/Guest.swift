//
//  Guest.swift
//  Mixer
//
//  Created by Josh Smith on 12/28/23.
//

import Foundation
import SwiftData

@Model
final class Guest {
    
    var name: String
    var isFavorite: Bool = false
    var photoData: Data?
//    var flavorProfile: [Flavor] = []
    var likes: Cocktails = []
    var dislikes: Cocktails = []
    
    init(_ name: String) {
        self.name = name
    }
    
    init(_ name: String, photo: Data) {
        self.name = name
        self.photoData = photo
    }
    
    static func <(lhs: Guest, rhs: Guest) -> Bool {
        lhs.name.lowercased() < rhs.name.lowercased()
    }
    
}

extension [Guest] {
    
    var favorites: [Guest] {
        return self.filter { guest in
            guest.isFavorite
        }
    }
    
    var nonFavorites: [Guest] {
        return self.filter { guest in
            !guest.isFavorite
        }
    }
    
}
