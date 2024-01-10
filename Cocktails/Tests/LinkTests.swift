//
//  LinkTests.swift
//  Cocktails
//
//  Created by Josh Smith on 9/11/22.
//

import SwiftUI

struct LinkTests: View {
    
    @State private var selected: [Cocktail] = []
    
    var body: some View {
        NavigationStack(path: $selected) {
            List(cocktails) { cocktail in
                NavigationLink(value: cocktail) {
                    Text(cocktail.name)
                }
            }
            .navigationDestination(for: Cocktail.self, destination: CocktailView.init)
            .navigationTitle("Cocktails")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Open") {
                        self.selected = [Cocktail("Martini")]
                    }
                }
            }
        }
    }
}

struct LinkTests_Previews: PreviewProvider {
    static var previews: some View {
        LinkTests()
    }
}
