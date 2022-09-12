//
//  CocktailList.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI

struct CocktailList: View {
    
    @EnvironmentObject private var bar: Bar
    
    @State private var shopping = false
    @State private var searchingIngredients = false
    @State private var viewingSettings = false
    @State private var viewingFriends = false
    @State private var showingFilter = false
    
    var body: some View {
        
        NavigationStack(path: $bar.selectedCocktail) {
            ScrollView {
                
                VStack {
                    if bar.filter == Filter.none && bar.search.isEmpty {
                        FeaturedCocktails()
                            .transition(.scale)
                    }
                    
                    ForEach(CocktailCategory.allCases, id: \.self) { category in
                        
                        if categoryMatchesFilter(category) && searchResultsInclude(category) {
                            CategoryRow(category: category)
                                .transition(.scale)

                            if category != CocktailCategory.allCases.last {
                                Divider()
                                    .transition(.scale)
                            }
                        }
                        
                    }
                }
                .padding(.bottom, 25)
                
            }
            .edgesIgnoringSafeArea(.horizontal)
            .searchable(text: $bar.search)
            .navigationTitle(bar.filter == .none ? "Featured" : bar.filter.name)
            .navigationDestination(for: Cocktail.self, destination: CocktailView.init)
            .toolbar {
                
                ToolbarItemGroup(placement: .cancellationAction) {
                    
                    Button {
                        searchingIngredients.toggle()
                    } label: {
                        Image(systemName: "vial.viewfinder")
                    }
                    .fullScreenCover(isPresented: $searchingIngredients) {
                        CocktailsByIngredient()
                    }
                    
                    Button {
                        shopping.toggle()
                    } label: {
                        Image(systemName: "cart")
                    }
                    .sheet(isPresented: $shopping) {
                        ShoppingView()
                    }
                    
                }
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button {
                        showingFilter.toggle()
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .symbolVariant(bar.filter == .none ? .none : .fill)
                    }
                    .sheet(isPresented: $showingFilter) {
                        FilterView()
                    }
                    
                    Menu {
                        
                        Button {
                            viewingFriends.toggle()
                        } label: {
                            Label("Friends", systemImage: "person.crop.circle")
                        }
                        
                        Button {
                            viewingSettings.toggle()
                        } label: {
                            Label("Settings", systemImage: "gear")
                        }
                        
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                    }
                    .sheet(isPresented: $viewingFriends) {
                        GuestsView()
                    }
                    .sheet(isPresented: $viewingSettings) {
                        SettingsView()
                    }
                
                }
                
            }
            
        }
        .background(Color.background)
        
    }
    
    func categoryMatchesFilter(_ category: CocktailCategory) -> Bool {
        let categoryNumbers = Set(category.recipes.map { $0.number })
        
        switch bar.filter {
        case .liked:
            return categoryNumbers.contains { cocktail in
                bar.likes.contains(cocktail)
            }
        case .disliked:
            return categoryNumbers.contains { cocktail in
                bar.dislikes.contains(cocktail)
            }
        case .notRated:
            return categoryNumbers.contains { cocktail in
                !bar.likes.contains(cocktail) && !bar.dislikes.contains(cocktail)
            }
        case .ingredient(let type):
            return Array(category.recipes.map { cocktail in
                cocktail.ingredients.map { ingredient in
                    ingredient.kind
                }
            }.joined()).contains(type)
        default:
            return true
        }
    }
    
    func searchResultsInclude(_ category: CocktailCategory) -> Bool {
        
        if bar.search.isEmpty {
            return true
        } else {
            
            let categoryMatchesSearch = category.name.lowercased().contains(bar.search.lowercased())
            
            var cocktailsMatchSearch: Bool {
                let cocktailNames = category.recipes.map { cocktail in
                    cocktail.name.lowercased()
                }
                let matches = cocktailNames.filter { cocktail in
                    cocktail.contains(bar.search.lowercased())
                }
                return !matches.isEmpty
            }
            
            var ingredientsMatchSearch: Bool {
                
                let ingredientList = Set(category.recipes.map { cocktail in
                    cocktail.ingredients.map { ingredient in
                        ingredient.name.lowercased()
                    }
                }.joined())
                
                return ingredientList.map { ingredient in
                    ingredient.contains(bar.search.lowercased())
                }.contains(true)
            
            }
            
            return categoryMatchesSearch || cocktailsMatchSearch || ingredientsMatchSearch
            
        }
        
    }
}

extension URL {
    
    var isDeepLink: Bool {
        return scheme == "cocktails"
    }
    
    var cocktail: Cocktail? {
        if let host {
            if (cocktails.map {$0.name.lowercased()}).contains(host.lowercased()) {
                return Cocktail(host)
            }
        }
        return nil
    }
    
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList()
            .environmentObject(Bar.preview)
//            .preferredColorScheme(.dark)
    }
}
