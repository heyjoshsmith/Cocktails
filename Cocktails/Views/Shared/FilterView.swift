//
//  FilterView.swift
//  Cocktails
//
//  Created by Josh Smith on 8/28/22.
//

import SwiftUI
import SwiftData

struct FilterView: View {
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @State private var search = ""
    
    var body: some View {
        
        NavigationStack {
            Form {
                if !selectedIngredients.isEmpty {
                    Section("Selected") {
                        ForEach(selectedIngredients) { ingredient in
                            button(for: ingredient)
                        }
                    }
                }
                
                if !numericalIngredients.isEmpty {
                    Section("#") {
                        ForEach(numericalIngredients, id: \.self) { ingredient in
                            button(for: ingredient)
                        }
                    }
                }
                
                ForEach(ingredientSections, id: \.self) { section in
                    Section {
                        ForEach(section, id: \.self) { ingredient in
                            button(for: ingredient)
                        }
                    } header: {
                        if let firstCharacter = section.first?.name.prefix(1) {
                            Text(firstCharacter)
                        }
                    }
                }
                
            }
            .searchable(text: $search)
            .navigationTitle("Filters")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    if !bar.filters.isEmpty {
                        Button("Reset", action: reset)
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Picker("Filter Type", selection: $bar.matchAllFilters) {
                        Text("All").tag(true)
                        Text("Any").tag(false)
                    }
                }
            }
            
        }
        
    }
    
    
    // Main Functions
    
    func toggle(_ filter: Filter) {
        if bar.filters.contains(filter) {
            bar.filters.removeAll { current in
                current == filter
            }
        } else {
            bar.filters.append(filter)
        }
    }
    
    func reset() {
        bar.filters.removeAll()
        dismiss()
    }
    
    
    // Supporting Info
    
    var selectedIngredients: [IngredientType] {
        return bar.filters.compactMap { filter in
            switch filter {
            case .ingredient(let ingredientType):
                return ingredientType
            default:
                return nil
            }
        }
    }
    
    var numericalIngredients: [IngredientType] {
        return ingredients.filter { ingredient in
            Int(ingredient.name.prefix(1)) != nil
        }
    }
    
    var ingredientSections: [[IngredientType]] {
        
        let firstCharacters = ingredients.filter({ ingredient in
            Int(ingredient.name.prefix(1)) == nil
        }).compactMap { ingredient in
            ingredient.name.prefix(1)
        }
        
        let sectionHeaders = Set(firstCharacters)
        
        let sections = sectionHeaders.map { character in
            ingredients.filter { ingredient in
                ingredient.name.prefix(1) == character
            }
        }
        
        return sections.sorted { lhs, rhs in
            lhs.first?.name ?? "" < rhs.first?.name ?? ""
        }
    }
    
    var ingredients: [IngredientType] {
        
        let original = Array(Set(bar.category.recipes.flatMap { recipe in
            recipe.ingredients.compactMap { ingredient in
                ingredient.kind
            }
        }))
        
        if search.isEmpty {
            return original
        } else {
            let searched = original.filter { ingredient in
                ingredient.name.localizedStandardContains(search)
            }
            return searched
        }
        
    }
    
    
    // Additional Views
    
    func button(for ingredient: IngredientType) -> some View {
        Button {
            toggle(.ingredient(ingredient))
        } label: {
            HStack {
                Text(ingredient.name)
                    .foregroundColor(selectedIngredients.contains(ingredient) ? .green : .primary)
                Spacer()
                if selectedIngredients.contains(ingredient) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .contentShape(Rectangle())
        }
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return FilterView()
        .environmentObject(Bar.shared)
        .modelContainer(container)
}
