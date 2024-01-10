//
//  CocktailPicker.swift
//  Cocktails
//
//  Created by Josh Smith on 6/28/23.
//

import SwiftUI

struct CocktailPicker: View {
    
    @EnvironmentObject private var bar: Bar
    @State private var showingFilter = false
    
    var body: some View {
        NavigationStack {
            CategoryGrid(for: bar.category)
                .searchable(text: $bar.search)
                .toolbarTitleMenu {
                    Picker("Categories", selection: $bar.category) {
                        ForEach(CocktailCategory.allCases) { category in
                            Text(category.name)
                                .tag(category)
                        }
                    }
                }
                .navigationTitle(bar.category.name)
                .toolbar {
                    ToolbarItemGroup {
                        
                        Button("Filter", systemImage: "line.horizontal.3.decrease.circle") {
                            showingFilter.toggle()
                        }
                        .symbolVariant(bar.filters.isEmpty ? .none : .fill)
                        .popover(isPresented: $showingFilter) {
                            FilterView()
                                .frame(width: 400, height: 500, alignment: .top)
                        }
                        
                    }
                }
        }
    }
    
}

#Preview {
    NavigationStack {
        CocktailPicker()
            .modelContainer(for: [Cocktail.self, Guest.self])
            .environmentObject(Bar.shared)
    }
}
