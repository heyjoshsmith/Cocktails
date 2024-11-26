//
//  GuestView.swift
//  Cocktails
//
//  Created by Josh Smith on 11/20/24.
//

import SwiftUI

struct GuestView: View {
    
    var guest: Guest
    
    init(_ guest: Guest) {
        self.guest = guest
    }
    
    @State private var editing = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                ZStack(alignment: .bottomTrailing) {
                    
                    if let photoData = guest.photoData, let photo = UIImage(data: photoData) {
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFit()
                        
                    } else {
                        Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.secondary)
                            .padding(75)
                            .background(LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                    
                    if guest.isFavorite {
                        Image(systemName: "star.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white, .yellow)
                            .frame(width: 30, height: 30, alignment: .center)
                            .padding()
                    }
                    
                }
                
                Text(guest.name)
                    .font(.largeTitle.weight(.semibold))
                
            }
            
        }
        .navigationTitle(verticalSizeClass == .compact ? guest.name : "")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .toolbar {
            Button("Edit") {
                editing.toggle()
            }
            .foregroundStyle(.white)
        }
        .sheet(isPresented: $editing) {
            GuestEditor(guest)
        }
    }
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
}

#Preview {
    NavigationStack {
        GuestView(Guest.previewGuests[0])
    }
}
