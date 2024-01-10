//
//  CategoryGrid.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/27/22.
//

import SwiftUI

struct CategoryGrid: View {
    
    var category: CocktailCategory
    
    init(for category: CocktailCategory) {
        self.category = category
    }
    
    @EnvironmentObject private var bar: Bar
    
    var body: some View {
        GeometryReader { frame in
            ScrollView {
                LazyVGrid(columns: columns(in: frame), spacing: 10) {
                    ForEach(cocktails) { cocktail in
                        NavigationLink {
                            CocktailView(for: cocktail)
                        } label: {
                            CocktailGridItem(cocktail, with: size(in: frame))
                        }
                        .cocktailButton(radius: 12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
            .navigationTitle(category.name)
        }
        .background(Color.background)
    }
    
    
    // Additional Info
    
    var cocktails: Cocktails {
        
        var searched: Cocktails {
            if bar.search.isEmpty {
                return category.recipes
            } else {
                return category.recipes.filter { cocktail in
                    cocktail.name.localizedStandardContains(bar.search)
                }
            }
        }
        
        var filtered: Cocktails {
            if bar.filters.isEmpty {
                return searched
            } else {
                return searched.filter { cocktail in
                    
                    let types = cocktail.ingredients.map { ingredient in
                        ingredient.kind
                    }
                    
                    let selectedIngredients = bar.filters.compactMap { filter in
                        switch filter {
                        case .ingredient(let ingredientType):
                            return ingredientType
                        default:
                            return nil
                        }
                    }
                    
                    let matchedFilters = selectedIngredients.map { selected in
                        types.contains(selected)
                    }
                    
                    let matchedAllIngredients = !matchedFilters.contains(false)
                    let matchedAnyIngredients = matchedFilters.contains(true)
                    
                    if bar.matchAllFilters {
                        return matchedAllIngredients
                    } else {
                        return matchedAnyIngredients
                    }
                    
                }
            }
        }
        
        return filtered
        
    }
    
    func size(in frame: GeometryProxy) -> CGFloat {
        return (frame.size.width - (15 * CGFloat(columns(in: frame).count)) - 15) / CGFloat(columns(in: frame).count)
    }
    
    func columns(in frame: GeometryProxy) -> Columns {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return Columns(2)
        case .pad:
            return Columns(frame.size.width > frame.size.height ? 6 : 4)
        case .tv:
            return Columns(10)
        case .mac:
            return Columns(frame.size.width > frame.size.height ? 6 : 4)
        case .vision:
            switch frame.size.width {
            case 1000...:
                return Columns(5)
            case 750...:
                return Columns(4)
            case 500...:
                return Columns(3)
            case 250...:
                return Columns(2)
            default:
                return Columns(1)
            }
        default:
            return Columns(4)
        }
    }
    
}

struct CategoryGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryGrid(for: .gin)
        }
        .modelContainer(for: [Cocktail.self, Guest.self])
        .environmentObject(Bar.shared)
    }
}
