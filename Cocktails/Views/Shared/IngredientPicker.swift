//
//  IngredientsView.swift
//  Cocktails
//
//  Created by Josh Smith on 8/28/22.
//

import SwiftUI
import SwiftData

struct IngredientPicker: View {
    
    @Binding var selected: [IngredientType]
    
    @State private var editing = EditMode.inactive
    @State private var selection = Set<IngredientType>()
    @State private var search = ""
    
    var body: some View {
        
        NavigationStack {
            List(selection: $selection) {
                
                Section {
                    ForEach(active) { ingredient in
                        Button {
                            select(ingredient)
                        } label: {
                            HStack {
                                Text(ingredient.name)
                                    .foregroundColor(selected.contains(ingredient) ? .secondary : .primary)
                                Spacer()
                                Image(systemName: selected.contains(ingredient) ? "checkmark" : "plus")
                            }
                        }
                        .disabled(selected.contains(ingredient))
                        .swipeActions(edge: .leading) {
                            Button("Hide", systemImage: "eye.slash") {
                                show(ingredient)
                            }
                            .tint(.red)
                        }
                    }
                    
                    if active.isEmpty {
                        Text("No Results Found")
                            .foregroundColor(.secondary)
                    }
                    
                }
                
                Section("Hidden") {
                    ForEach(hidden) { ingredient in
                        Text(ingredient.name)
                            .swipeActions(edge: .leading) {
                                Button {
                                    show(ingredient)
                                } label: {
                                    Label("Show", systemImage: "eye.fill")
                                }
                                .tint(.green)
                            }
                    }
                    
                    if hidden.isEmpty {
                        Text("No Results Found")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            .navigationTitle("Ingredients")
            .searchable(text: $search)
            .toolbar {
                
                #if os(visionOS)
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                #endif
                ToolbarItem(placement: .automatic) {
                    if editing.isEditing {
                        Button("Toggle", action: toggle)
                            .disabled(selection.isEmpty)
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    EditButton()
                }
                
            }
            .environment(\.editMode, $editing)
        }
    }
    
    
    // Main Functions
    
    func select(_ ingredient: IngredientType) {
        selected.append(ingredient)
        close()
    }
    
    func show(_ ingredient: IngredientType) {
        withAnimation {
            bar.hiddenIngredients.removeAll { hiddenIngredient in
                hiddenIngredient == ingredient
            }
        }
    }
    
    func hide(_ ingredient: IngredientType) {
        withAnimation {
            bar.hiddenIngredients.append(ingredient)
        }
    }
    
    func toggle() {
        withAnimation {
            
            var hiddenArray = [IngredientType]()
            var activeArray = [IngredientType]()
            for ingredient in selection {
                if active.contains(ingredient) {
                    hiddenArray.append(ingredient)
                } else if hidden.contains(ingredient) {
                    activeArray.append(ingredient)
                }
            }
            
            bar.hiddenIngredients.append(contentsOf: hiddenArray)
            bar.hiddenIngredients.removeAll { ingredient in
                activeArray.contains(ingredient)
            }
            
            selection.removeAll()
            
            editing = .inactive
            
        }
    }
    
    func close() {
        dismiss()
    }
    
    
    // Supporting Info
    
    var active: [IngredientType] {
        
        let visible = IngredientType.allCases.filter { ingredient in
            !bar.hiddenIngredients.contains(ingredient)
        }
        
        if search.isEmpty {
            return visible.sorted(by: <)
        } else {
            let searched = visible.filter { ingredient in
                ingredient.name.lowercased().contains(search.lowercased())
            }
            return searched.sorted(by: <)
        }
        
    }
    
    var hidden: [IngredientType] {
        if search.isEmpty {
            return bar.hiddenIngredients.sorted(by: <)
        } else {
            let searched = bar.hiddenIngredients.filter { ingredient in
                ingredient.name.lowercased().contains(search.lowercased())
            }
            return searched.sorted(by: <)
        }
    }
    
    
    // Environments
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editMode) private var editMode
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return IngredientPicker(selected: .constant([.agave]))
        .environmentObject(Bar.shared)
        .modelContainer(container)
}
