//
//  GuestRow.swift
//  Cocktails
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
            
            AsyncImageLoader(
                photoData: guest.photoData,
                placeholderImage: Image(systemName: "person.crop.circle"),
                imageSize: CGSize(width: 50, height: 50)
            )
            
            Text(guest.name)
                .foregroundStyle(Color.label)
            Spacer()
            if guest.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .contextMenu {
            if guest.isHost {
                Button("Set as Guest",systemImage: "figure.walk.arrival") {
                    guest.isHost = false
                }
            } else {
                Button("Set as Host",systemImage: "house") {
                    guest.isHost = true
                }
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


#Preview {
    GuestRow(for: Guest.previewGuests[0])
}
