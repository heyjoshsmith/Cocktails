//
//  CategoryRow.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI

struct CategoryRow: View {
    
    @EnvironmentObject private var bar: Bar
    var category: CocktailCategory
    
    @State private var opacity = 1.0
    @State private var isActive = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            #if os(visionOS)
            HStack {
                Text(category.name)
                    .font(.title.weight(.bold))
                    .padding(.leading, 15)
                Spacer()
                NavigationLink(destination: CategoryGrid(for: category)) {
                    HStack {
                        Text("View All")
                        Image(systemName: "chevron.right")
                    }
                }
            }
            .foregroundStyle(labelColor(for: category))
            .padding([.horizontal, .top])
            #else
            NavigationLink {
                CategoryGrid(for: category)
            } label: {
                HStack {
                    Text(category.name)
                        .font(.title2.weight(.bold))
                        .padding(.leading, 15)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
                .foregroundStyle(labelColor(for: category))
            }
            .padding(.top, 5)
            .padding(.trailing)
            #endif

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 15) {
                    ForEach(category.recipes) { cocktail in
                        if searchIncludes(cocktail) {
                            CategoryItem(cocktail: cocktail)
                                .transition(.scale)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.trailing, 50)
            }
            .frame(height: 185)
            
        }
        .onAppear(perform: load)
        
    }
    
    
    
    // Additional Info
    
    func searchIncludes(_ cocktail: Cocktail) -> Bool {
        
        if bar.search.isEmpty {
            return true
        } else {
                        
            let cocktailsMatchSearch = cocktail.name.lowercased().contains(bar.search.lowercased())
            
            var ingredientsMatchSearch: Bool {
                
                let ingredientList = cocktail.ingredients.map { ingredient in
                    ingredient.name.lowercased()
                }
                
                return ingredientList.map { ingredient in
                    ingredient.contains(bar.search.lowercased())
                }.contains(true)
            
            }
            
            return cocktailsMatchSearch || ingredientsMatchSearch
            
        }
        
    }
    
    func labelColor(for category: CocktailCategory) -> Color {
        #if os(visionOS)
        return Color.primary
        #else
        return category.color
        #endif
    }
    
    
    
    // Main Functions
    
    func viewAll() {
        opacity = 0.5
        isActive = true
    }
    
    func load() {
        opacity = 1
    }
    
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                Group {
                    CategoryRow(category: .brandy)
                    CategoryRow(category: .dessert)
                    CategoryRow(category: .gin)
                }
                .listRowInsets(EdgeInsets())
                .padding(.vertical)
            }
            .listStyle(.inset)
            .navigationTitle("Cocktails")
        }
    }
}
