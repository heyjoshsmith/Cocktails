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
            NavigationLink {
                CategoryGrid(for: category)
            } label: {
                HStack {
                    Text(category.name)
                        .foregroundStyle(category.color)
                        .font(.title2.weight(.bold))
                        .padding(.leading, 15)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(category.color)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.top, 5)
            .padding(.trailing)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 15) {
                    ForEach(category.recipes) { cocktail in
                        if filterIncludes(cocktail) && searchIncludes(cocktail) {
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
    
    func filterIncludes(_ cocktail: Cocktail) -> Bool {
        
        let liked = bar.likes.contains(cocktail.number)
        let disliked = bar.dislikes.contains(cocktail.number)
        
        switch bar.filter {
        case .liked:
            return liked
        case .disliked:
            return disliked
        case .notRated:
            return !liked && !disliked
        case .none:
            return true
        case .ingredient(let type):
            return cocktail.ingredients.map { $0.kind }.contains(type)
        }
    }
    
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
        NavigationView {
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
