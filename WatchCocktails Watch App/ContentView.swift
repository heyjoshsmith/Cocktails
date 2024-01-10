//
//  ContentView.swift
//  WatchCocktails Watch App
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory: CocktailCategory?
    
    var body: some View {
        NavigationStack {
            List {
//                HStack {
//                    Text("Cocktails")
//                        .font(.title2.weight(.bold))
//                    Spacer()
//                }
//                .listRowBackground(Color.clear)
//                .listRowInsets(EdgeInsets())
                ForEach(CocktailCategory.allCases) { category in
                    NavigationLink(category.name, value: category)
                }
            }
            .navigationTitle("Cocktails")
            .navigationDestination(for: CocktailCategory.self, destination: CategoryView.init)
            .navigationDestination(for: Cocktail.self, destination: CocktailView.init)
//            .toolbar(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
