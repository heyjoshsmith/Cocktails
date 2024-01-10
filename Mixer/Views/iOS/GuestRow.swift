//
//  GuestRow.swift
//  Mixer
//
//  Created by Josh Smith on 12/29/23.
//

import SwiftUI

struct GuestRow: View {
    
    var guest: Guest
    
    init(for guest: Guest) {
        self.guest = guest
    }
    
    var body: some View {
        HStack {
            
            if let photoData = guest.photoData, let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(.circle)
            } else {
                Image(systemName: "person.crop.circle")
                    .symbolRenderingMode(.multicolor)
            }
            
            Text(guest.name)
            Spacer()
            if guest.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button("Favorite", systemImage: "star") {
                guest.isFavorite.toggle()
            }.tint(.yellow)
                .symbolVariant(guest.isFavorite ? .slash : .none)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button("Delete", systemImage: "trash") {
                modelContext.delete(guest)
            }.tint(.red)
        }
    }
    
    @Environment(\.modelContext) private var modelContext
    
}
