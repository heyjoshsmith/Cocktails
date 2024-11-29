//
//  Guest.swift
//  Cocktails
//
//  Created by Josh Smith on 12/28/23.
//

import SwiftUI
import SwiftData

@Model
final class Guest: Comparable {
    
    var id: UUID = UUID()
    var name: String
    var isHost: Bool = false
    var isFavorite: Bool = false
    var photoData: Data?
    private var likesData: Data? // Serialized data
    private var dislikesData: Data? // Serialized data
    
    init(_ name: String) {
        self.name = name
    }
    
    init(_ name: String, photo: Data?, isHost: Bool, isFavorite: Bool) {
        self.name = name
        self.photoData = photo
        self.isHost = isHost
        self.isFavorite = isFavorite
    }
    
    // Computed properties to access likes and dislikes as arrays
    var likes: [Cocktail] {
        get {
            return decode(from: likesData) ?? []
        }
        set {
            likesData = encode(newValue)
        }
    }
    
    var dislikes: [Cocktail] {
        get {
            return decode(from: dislikesData) ?? []
        }
        set {
            dislikesData = encode(newValue)
        }
    }
    
    
    
    // Implement Comparable requirements
    static func < (lhs: Guest, rhs: Guest) -> Bool {
        lhs.name < rhs.name
    }

    static func == (lhs: Guest, rhs: Guest) -> Bool {
        lhs.id == rhs.id
    }
    
    
    
    // Helper functions for encoding and decoding
    private func encode<T: Codable>(_ value: T) -> Data? {
        return try? JSONEncoder().encode(value)
    }
    
    private func decode<T: Codable>(from data: Data?) -> T? {
        guard let data = data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
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
    
    var initials: String {
        let names = self.name.components(separatedBy: " ")
        let initials = names.map { name in
            name.first?.uppercased() ?? ""
        }
        
        return initials.joined(separator: "")
    }
    
    func like(_ cocktail: Cocktail) {
        withAnimation {
            self.likes.append(cocktail)
            self.dislikes.removeAll { dislike in
                cocktail == dislike
            }
        }
        print("Liking",cocktail.name,self.likes.map { $0.name })
    }
    
    func likes(_ cocktail: Cocktail) -> Bool {
        return likes.contains { item in
            cocktail.name == item.name
        }
    }
    
    func dislike(_ cocktail: Cocktail) {
        withAnimation {
            self.dislikes.append(cocktail)
            self.likes.removeAll { item in
                cocktail.name == item.name
            }
        }
    }
    
    func dislikes(_ cocktail: Cocktail) -> Bool {
        return dislikes.contains { dislike in
            cocktail.name == dislike.name
        }
    }
    
    func remove(_ cocktail: Cocktail) {
        withAnimation {
            self.likes.removeAll { item in
                cocktail.name == item.name
            }
            self.dislikes.removeAll { item in
                cocktail.name == item.name
            }
        }
    }
}

typealias Guests = [Guest]
extension Guests {
    
    func host() -> Guest? {
        return self.first { guest in
            guest.isHost
        }
    }
    
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
    
    func thatLike(_ cocktail: Cocktail) -> Guests {
        return self.filter { guest in
            guest.likes(cocktail)
        }
    }
    
    func thatDontLike(_ cocktail: Cocktail) -> Guests {
        return self.filter { guest in
            guest.dislikes(cocktail)
        }
    }
    
}
