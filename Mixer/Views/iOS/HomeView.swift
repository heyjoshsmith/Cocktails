//
//  HomeView.swift
//  Mixer
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var bar: Bar
    
    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], animation: .default)
    private var people: FetchedResults<Person>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people, id: \.self) { person in
                    Text(person.name ?? "Name")
                        .swipeActions {
                            Button("Delete") {
                                bar.container.viewContext.delete(person)
                            }
                        }
                }
            }
            .navigationTitle("People")
            .toolbar {
                Button("Add") {
                    let person = Person(context: bar.container.viewContext)
                    person.name = "Josh"
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, Bar.preview.container.viewContext)
            .environmentObject(Bar.preview)
    }
}
