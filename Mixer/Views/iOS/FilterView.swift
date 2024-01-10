//
//  FilterView.swift
//  Mixer
//
//  Created by Josh Smith on 8/28/22.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @State private var search = ""
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    HStack {
                        Text("Ingredients")
                        Spacer()
                    }
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)
                    
                    LazyVStack(spacing: 15) {
                        ForEach(ingredients) { ingredient in
                            
                            Button {
                                setFilter(to: .ingredient(ingredient))
                            } label: {
                                HStack {
                                    Text(ingredient.name)
                                        .foregroundColor(bar.filter.name == ingredient.name ? .green : .primary)
                                    Spacer()
                                    if bar.filter.name == ingredient.name {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    }
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        
                            if ingredient != ingredients.last {
                                Divider()
                                    .padding(.trailing, -15)
                            }
                            
                        }
                    }
                    .padding()
                    .background(Color.background2)
                    .cornerRadius(10)
                    
                }
                .padding()
                .searchable(text: $search, prompt: "Search Ingredients")
                
            }
            .navigationTitle("Filters")
            .background(Color.background)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    if bar.filter != .none {
                        Button("Reset", action: reset)
                    }
                }
            }
            
        }
        
    }
    
    func setFilter(to filter: Filter) {
        bar.filter = filter
        dismiss()
    }
    
    func reset() {
        bar.filter = .none
        dismiss()
    }
    
    var ingredients: [IngredientType] {
        
        let original = IngredientType.allCases
        
        if search.isEmpty {
            return original.sorted(by: <)
        } else {
            let searched = original.filter { ingredient in
                ingredient.name.lowercased().contains(search.lowercased())
            }
            return searched.sorted(by: <)
        }
        
    }
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .preferredColorScheme(.dark)
    }
}
