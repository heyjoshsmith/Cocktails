//
//  GuestsView.swift
//  Cocktails
//
//  Created by Josh Smith on 2/28/22.
//

import SwiftUI

struct GuestsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)], animation: .default)
    private var people: FetchedResults<Person>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(people, id: \.self) { person in
                    HStack {
                        Text(person.name ?? "")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
}

struct GuestsView_Previews: PreviewProvider {
    static var previews: some View {
        GuestsView()
            .environment(\.managedObjectContext, Bar.preview.container.viewContext)
    }
}
