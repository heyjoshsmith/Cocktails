//
//  GuestsView.swift
//  Cocktails
//
//  Created by Josh Smith on 2/28/22.
//

import SwiftUI
import SwiftData

struct GuestsView: View {
    
    @Query(sort: \Guest.name) private var guests: [Guest]
    
    @State private var viewingGuest: Guest?
    @State private var addingGuest = false
    @State private var search = ""
        
    var body: some View {
        NavigationStack {
            List {
                if guests.isEmpty {
                    ContentUnavailableView("No Guests", systemImage: "person.2.crop.square.stack", description: Text(LocalizedStringKey("Get started by tapping the \(Image(systemName: "plus")) button to add your first guest.")))
                } else if filteredGuests.isEmpty {
                    ContentUnavailableView.search(text: search)
                } else {
                    if !filteredGuests.favorites.isEmpty {
                        Section("Favorites") {
                            ForEach(filteredGuests.favorites) { guest in
                                NavigationLink {
                                    GuestView(guest)
                                } label: {
                                    GuestRow(for: guest)
                                }
                            }
                        }
                    }
                    if !filteredGuests.nonFavorites.isEmpty {
                        Section("More") {
                            ForEach(filteredGuests.nonFavorites) { guest in
                                NavigationLink {
                                    GuestView(guest)
                                } label: {
                                    GuestRow(for: guest)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Guests")
            .toolbar {
                
                if let guest = guests.first(where: { guest in
                        guest.isHost
                    }) {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            viewingGuest = guest
                        } label: {
                            AsyncImageLoader(
                                photoData: guest.photoData,
                                placeholderImage: Image(systemName: "person.crop.circle"),
                                imageSize: CGSize(width: 40, height: 40)
                            )
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        addingGuest.toggle()
                    }
                }
            }
            .searchable(text: $search)
            .sheet(isPresented: $addingGuest) {
                GuestEditor()
            }
            .sheet(item: $viewingGuest) { guest in
                GuestView(guest)
            }
        }
    }
    
    var filteredGuests: [Guest] {
        if search.isEmpty {
            return guests.sorted(by: <)
        } else {
            return guests.filter { guest in
                guest.name.localizedStandardContains(search)
            }.sorted(by: <)
        }
    }
    
    @Environment(\.modelContext) private var modelContext
    
}

#Preview {
    
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Guest.self, configurations: config)
    
    Guest.previewGuests.forEach { guest in
        container.mainContext.insert(guest)
    }
    
    return GuestsView()
        .environmentObject(Bar.preview)
        .modelContainer(container)
}
