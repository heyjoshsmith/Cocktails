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
    
    @State private var viewingCategory: CocktailCategory?
    
    init() {
        #if os(visionOS)
        self._viewingCategory = State(initialValue: .vodka)
        #endif
    }
    
    var body: some View {
        NavigationStack(path: $bar.selectedCocktail) {
            ScrollView {
                
                VStack {
                    
                    #if !os(visionOS)
                    if bar.filters.isEmpty && bar.search.isEmpty {
                        FeaturedCocktails()
                            .transition(.scale)
                    }
                    #endif
                    
                    ForEach(CocktailCategory.allCases, id: \.self) { category in
                        
                        if bar.filterIncludes(category) && bar.searchInclude(category) && (viewingCategory == nil || viewingCategory == category) {
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
            .navigationTitle(bar.filters.isEmpty ? "Featured" : "Filtered")
            .navigationDestination(for: Cocktail.self, destination: CocktailView.init)
            .toolbar { leadingToolbar ; trailingToolbar }
            
        }
        .background(Color.background)
        .onAppear(perform: bar.reloadWidgets)
    }
    
    
    
    // Toolbar
    
    var leadingToolbar: some ToolbarContent {
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
    }
        
    var trailingToolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .confirmationAction) {
            Button {
                showingFilter.toggle()
            } label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .symbolVariant(bar.filters.isEmpty ? .none : .fill)
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
//            .preferredColorScheme(.dark)
    }
}
