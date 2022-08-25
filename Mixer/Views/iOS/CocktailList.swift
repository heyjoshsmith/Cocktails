//
//  CocktailList.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI

struct CocktailList: View {
    
    @EnvironmentObject private var bar: Bar
    
    @State private var viewingSettings = false
    @State private var viewingFriends = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if bar.filter == .none {
                    FeaturedCocktails()
                        .transition(.scale)
                }
                
                ForEach(CocktailCategory.allCases, id: \.self) { category in
                    
                    if categoryMatchesFilter(category) {
                        CategoryRow(category: category)
                            .transition(.scale)

                        if category != CocktailCategory.allCases.last {
                            Divider()
                                .transition(.scale)
                        }
                    }
                    
                }
                
            }
            .navigationTitle(bar.filter == .none ? "Featured" : bar.filter.name)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        viewingSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .sheet(isPresented: $viewingSettings) {
                        SettingsView()
                    }
                }
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    Menu {
                        ForEach(Filter.allCases, id: \.self) { filter in
                            Button {
                                withAnimation {
                                    bar.filter = filter
                                }
                            } label: {
                                HStack {
                                    Text(filter.name)
                                    Image(systemName: filter.icon)
                                }
                            }
                        }

                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .symbolVariant(bar.filter == .none ? .none : .fill)
                    }
                    
                    Button {
                        viewingFriends.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                    .sheet(isPresented: $viewingFriends) {
                        GuestsView()
                    }
                }
                
            }
        }
        .background(Color.background)
        #if os(iOS)
        .navigationViewStyle(.stack)
        #endif
        
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
        default:
            return true
        }
    }
    
}

struct CocktailList_Previews: PreviewProvider {
    static var previews: some View {
        CocktailList()
//            .preferredColorScheme(.dark)
    }
}
