//
//  CocktailPicker.swift
//  Cocktails
//
//  Created by Josh Smith on 6/28/23.
//

import SwiftUI

struct CocktailPicker: View {
    
    @EnvironmentObject private var bar: Bar
    @State private var category: CocktailCategory = .vodka
    @State private var showingFilter = false
    
    var body: some View {
        NavigationStack {
            CategoryGrid(for: category)
                .searchable(text: $bar.search)
                .toolbarTitleMenu {
                    Picker("Categories", selection: $category) {
                        ForEach(CocktailCategory.allCases) { category in
                            Text(category.name)
                                .tag(category)
                        }
                    }
                }
                .navigationTitle(category.name)
                .toolbar {
                    ToolbarItemGroup {
                        
                        Button {
                            showingFilter.toggle()
                        } label: {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .symbolVariant(bar.filter == .none ? .none : .fill)
                        }
                        .popover(isPresented: $showingFilter) {
                            FilterView()
                                .frame(width: 300, height: 400, alignment: .top)
                        }
                        
                    }
                }
        }
    }
    
}

#Preview {
    NavigationStack {
        CocktailPicker()
    }
}
