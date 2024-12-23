//
//  MenuView.swift
//  Cocktails
//
//  Created by Josh Smith on 9/7/22.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var menu: [MenuItem]
    
    init(_ menu: Binding<[MenuItem]>) {
        self._menu = menu
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var search = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                
                if search.isEmpty {
                    Section {
                        ForEach($menu) { $item in
                            MenuItemLabel(menuItem: $item)
                                .swipeActions {
                                    Button {
                                        toggle(item.cocktail)
                                    } label: {
                                        Label("Remove", systemImage: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                        
                        if menu.isEmpty {
                            Text("Select a drink from the list below.")
                        }
                    } header: {
                        Text("Menu")
                            .font(.title.weight(.bold))
                            .foregroundColor(.primary)
                            .textCase(.none)
                    }
                }
                
                ForEach(CocktailCategory.allCases, id: \.self) { category in
                    if !category.searchRecipes(search).isEmpty {
                        Section(category.name) {
                            ForEach(category.searchRecipes(search)) { cocktail in
                                cocktailRow(for: cocktail)
                                    .disabled(menuContains(cocktail))
                                    .transition(.scale)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Cocktails")
            .searchable(text: $search)
        }
        
    }
    
    func cocktailRow(for cocktail: Cocktail) -> some View {
        return NavigationLink {
            CocktailView(for: cocktail)
        } label: {
            HStack {
                CocktailLabel(cocktail, onMenu: menuContains(cocktail))
                Spacer()
                if !menuContains(cocktail) {
                    Button {
                        toggle(cocktail)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    func menuContains(_ cocktail: Cocktail) -> Bool {
        return menu.contains { item in
            item.cocktail.name == cocktail.name
        }
    }
    
    func toggle(_ cocktail: Cocktail) {
        withAnimation {
            if menuContains(cocktail) {
                menu.removeAll { item in
                    item.cocktail.name == cocktail.name
                }
            } else {
                menu.append(MenuItem(cocktail, count: 1))
            }
        }
    }
    
    struct MenuItemLabel: View {
        
        @Binding var menuItem: MenuItem
     
        var body: some View {
            HStack(spacing: 15) {
                
                menuItem.cocktail.squareImage(size: 50)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(menuItem.cocktail.name)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text("\(menuItem.count) Drink\(menuItem.count == 1 ? "" : "s")")
                        .foregroundColor(.secondary)

                }
                
                Spacer()
                
                Stepper("Drinks", value: $menuItem.count)
                    .labelsHidden()
                
            }
        }
        
    }
    
    struct CocktailLabel: View {
        
        var cocktail: Cocktail
        var onMenu: Bool
        
        init(_ cocktail: Cocktail, onMenu: Bool) {
            self.cocktail = cocktail
            self.onMenu = onMenu
        }
     
        var body: some View {
            HStack(spacing: 15) {
                
                cocktail.squareImage(size: 50)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(cocktail.name)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(onMenu ? "Already Added" : cocktail.flavorProfile)
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .lineLimit(2)
                    
                }
                
            }
        }
        
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(.constant([MenuItem(Cocktail.example(of: "Martini"), count: 4)]))
    }
}
