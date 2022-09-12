//
//  ShoppingView.swift
//  Mixer
//
//  Created by Josh Smith on 9/6/22.
//

import SwiftUI

struct ShoppingView: View {
    
    @AppStorage("Menu") var menu = [MenuItem]()
    @AppStorage("Shopping Cart") var shoppingCart = [IngredientType]()
    
    @State private var viewingMenu = false
    @State private var includeGarnishes = false
    
    @State private var editingCount = false
    @State private var drink: Cocktail?
    @State private var count: Int?
    
    var body: some View {
        NavigationStack {
            Group {
                
                if menu.isEmpty {
                    
                    Button {
                        viewingMenu.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                            Text("Add Drink")
                            Spacer()
                        }
                        .padding(.vertical, 20)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                    }
                    .padding()
                    
                } else {
                    List {
                        
                        drinkMenu
                        
                        Section("Ingredients") {
                            ForEach(menu.ingredientList(false), id: \.kind) { item in
                                
                                Button {
                                    toggle(item.kind)
                                } label: {
                                    ingredientLabel(for: item)
                                }
                                .buttonStyle(.plain)
                                
                            }
                            
                        }
                        
                        if !menu.garnishes.isEmpty {
                            Section("Garnishes") {
                                ForEach(menu.garnishes) { garnish in
                                    
                                    Button {
                                        toggle(garnish)
                                    } label: {
                                        label(for: garnish)
                                    }
                                    .buttonStyle(.plain)
                                    
                                }
                            }
                        }
                        
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Shopping List")
            .sheet(isPresented: $viewingMenu) {
                MenuView($menu)
            }
            .alert(drink?.name ?? "Unknown Drink", isPresented: $editingCount, actions:  {
                TextField("Number of Drinks", value: $count, format: .number)
                    .keyboardType(.numberPad)
                Button("Done", action: saveCount)
            }, message: {
                Text("Enter the number of \(drink?.name ?? "Unknown Drink") drinks you'd like to make.")
            })
            .toolbar {
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Reset", role: .destructive, action: reset)
                }
                
            }
        }
    }
    
    func saveCount() {
        if let count {
            let index = menu.firstIndex { item in
                item.cocktail == drink
            }
            if let index {
                menu[index].count = count
            }
            self.count = nil
        }
    }
    
    func toggle(_ ingredient: IngredientType) {
        withAnimation {
            if shoppingCart.contains(ingredient) {
                shoppingCart.removeAll { item in
                    item == ingredient
                }
            } else {
                shoppingCart.append(ingredient)
            }
        }
    }
    
    func label(for ingredient: IngredientType) -> some View {
        HStack(spacing: 15) {
            
            if shoppingCart.contains(ingredient) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    .font(.system(size: 23))
                    .transition(.scale)
            }
            
            if !shoppingCart.contains(ingredient) {
                Image(systemName: "circle")
                    .foregroundColor(.label3)
                    .font(.system(size: 23))
                    .transition(.scale)
            }
                        
            VStack(alignment: .leading) {
                Text(ingredient.name)
                    .foregroundColor(.primary)
                Text(cocktailsThatInclude(ingredient))
                    .foregroundColor(.secondary)
                    .font(.callout)
                    .lineLimit(1)
            }
            
            Spacer()
            
        }
        .contentShape(Rectangle())
    }
    
    func ingredientLabel(for ingredient: Ingredient) -> some View {
        
        HStack(spacing: 15) {
            
            label(for: ingredient.kind)
            
            Text(ingredient.measurement)
                .foregroundColor(.secondary)
            
        }
        .contentShape(Rectangle())
        
    }
    
    func cocktailsThatInclude(_ ingredient: IngredientType) -> String {
        let cocktails = menu.filter { item in
            item.cocktail.ingredients.map { $0.kind }.contains(ingredient)
        }
        let list = cocktails.map { $0.cocktail.name }
        
        return ListFormatter.localizedString(byJoining: list)
    }
    
    func reset() {
        menu.removeAll()
        shoppingCart.removeAll()
    }
    
    func demo() {
        menu = Cocktail.random(1...5).map { MenuItem($0, count: Int.random(in: 1...4))}
    }
    
    func addToMenu(cocktail: Cocktail) {
        menu.append(MenuItem(cocktail, count: 1))
        viewingMenu.toggle()
    }
    
    var addDrinkButton: some View {
        return VStack {
            
            Button {
                viewingMenu.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 30))
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.fill)
                    .cornerRadius(7)
            }
            
            Text("Add Drink")
                .font(.system(size: 15))
                .foregroundColor(.primary)
        }
    }
    
    func drinkButton(for item: MenuItem) -> some View {
        return Menu {
            Button {
                drink = item.cocktail
                editingCount.toggle()
            } label: {
                Label("Edit Number of Drinks", systemImage: "numbersign")
            }
            Button(role: .destructive) {
                withAnimation {
                    menu.removeAll { menuItem in
                        menuItem == item
                    }
                }
            } label: {
                Label("Remove from Menu", systemImage: "trash")
            }
        } label: {
            ZStack {
                
                item.cocktail.squareImage(size: 100)
                
                Image(systemName: "\(item.count).circle.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.system(size: 30))
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.black.opacity(0.5))
                
            }
            .cornerRadius(7)
        }
    }
    
    var drinkMenu: some View {
        return Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    
                    addDrinkButton
                    
                    ForEach(menu) { item in
                        VStack {
                            
                            drinkButton(for: item)
                            
                            Text(item.cocktail.name)
                                .font(.system(size: 15))
                                .multilineTextAlignment(.center)
                                .frame(width: 100)
                        }
                    }
                    
                }
                .padding()
            }
            .listRowBackground(Color.clear)
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
    
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
