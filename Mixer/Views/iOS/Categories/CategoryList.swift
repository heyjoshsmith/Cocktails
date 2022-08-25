//
//  CategoryList.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/27/22.
//

import SwiftUI

struct CategoryList: View {
    var category: CocktailCategory
    
    init(for category: CocktailCategory) {
        self.category = category
    }
    
    var body: some View {
        List {
            ForEach(category.recipes) { cocktail in
                VStack {
                    NavigationLink {
                        CocktailView(for: cocktail)
                    } label: {
                        row(for: cocktail)
                    }
                    
                    if cocktail != category.recipes.last {
                        Divider()
                            .padding(.leading, 50)
                            .padding(.trailing, -20)
                    }
                }
                .listRowSeparator(.hidden)
                .padding(5)
                .padding(.horizontal)
                .listRowInsets(EdgeInsets())
                .padding(.top, category.recipes.firstIndex(of: cocktail) == 0 ? 5 : 0)
                .padding(.bottom, category.recipes.firstIndex(of: cocktail) == (category.recipes.count - 1) ? 5 : 0)
            }
        }
        .navigationTitle(category.name)
    }
    
    func row(for cocktail: Cocktail) -> some View {
        return HStack(alignment: .top, spacing: 15) {
            
            cocktail.squareImage(size: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(cocktail.name)
                Text(cocktail.flavorProfile)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            
            Spacer()
            
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryList(for: .brandy)
        }
    }
}
