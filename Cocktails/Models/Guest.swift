//
//  Guest.swift
//  Cocktails
//
//  Created by Josh Smith on 12/28/23.
//

import Foundation
import SwiftData

@Model
final class Guest {
    
    var id: UUID = UUID()
    var name: String
    var isHost: Bool = false
    var isFavorite: Bool = false
    var photoData: Data?
//    var flavorProfile: [Flavor] = []
    var likes: Cocktails = []
    var dislikes: Cocktails = []
    
    init(_ name: String) {
        self.name = name
    }
    
    init(_ name: String, photo: Data?, isHost: Bool, isFavorite: Bool) {
        self.name = name
        self.photoData = photo
        self.isHost = isHost
        self.isFavorite = isFavorite
    }
    
    static func <(lhs: Guest, rhs: Guest) -> Bool {
        lhs.name.lowercased() < rhs.name.lowercased()
    }
    
}

extension Guest {
    static var previewGuests: [Guest] {
        return [
            Guest("Josh Smith", photo: nil, isHost: true, isFavorite: false),
            Guest("Cesar Mayorga", photo: nil, isHost: false, isFavorite: true),
            Guest("James Durner", photo: nil, isHost: false, isFavorite: false),
            Guest("Mickey Ali", photo: nil, isHost: false, isFavorite: false),
            Guest("Brandon Witcher", photo: nil, isHost: false, isFavorite: false),
            Guest("Beau Witcher", photo: nil, isHost: false, isFavorite: false)
        ]
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
            !guest.isFavorite && !guest.isHost
        }
    }
    
}
