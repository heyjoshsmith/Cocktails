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
                
                tastesView("Likes", cocktails: guest.likes)
                tastesView("Dislikes", cocktails: guest.dislikes)
                
            }
            .padding(.bottom, 100)
            
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
    
    func tastesView(_ name: String, cocktails: Cocktails) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                Spacer()
            }
            .font(.title.bold())
            .padding(.horizontal)
            if cocktails.isEmpty {
                HStack {
                    Text("None")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.horizontal)
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(cocktails.sorted(by: <)) { cocktail in
                            NavigationLink(destination: CocktailView(for: cocktail)) {
                                CategoryItem(cocktail: cocktail)
                            }
                            .transition(.scale)
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(.vertical)
    }
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
}

#Preview {
    NavigationStack {
        GuestView(Guest.previewGuests[0])
    }
}
