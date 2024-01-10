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
                    Section("Favorites") {
                        ForEach(filteredGuests.favorites) { guest in
                            GuestRow(for: guest)
                        }
                    }
                    Section {
                        ForEach(filteredGuests.nonFavorites) { guest in
                            GuestRow(for: guest)
                        }
                    }
                }
            }
            .navigationTitle("Guests")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    addingGuest.toggle()
                }
            }
            .searchable(text: $search)
            .sheet(isPresented: $addingGuest) {
                GuestEditor()
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

struct GuestsView_Previews: PreviewProvider {
    static var previews: some View {
        GuestsView()
            .modelContainer(for: [Guest.self])
    }
}
