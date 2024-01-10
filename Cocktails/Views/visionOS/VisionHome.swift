//
//  VisionHome.swift
//  Cocktails
//
//  Created by Josh Smith on 6/28/23.
//

import SwiftUI

struct VisionHome: View {
    var body: some View {
        TabView {
            CocktailPicker()
                .tabItem {
                    Label("Cocktails", systemImage: "wineglass")
                }
            CocktailsByIngredient()
                .tabItem {
                    Label("Ingredients", systemImage: "vial.viewfinder")
                }
            ShoppingView()
                .tabItem {
                    Label("Shopping", systemImage: "cart")
                }
            GuestsView()
                .tabItem {
                    Label("Friends", systemImage: "person.crop.circle")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    VisionHome()
}
