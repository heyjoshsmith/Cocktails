//
//  IngredientsView.swift
//  Mixer
//
//  Created by Josh Smith on 8/28/22.
//

import SwiftUI

struct IngredientsView: View {
    
    @Binding var selected: [IngredientType]
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editMode) private var editMode
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
                            Button {
                                show(ingredient)
                            } label: {
                                Label("Hide", systemImage: "eye.slash")
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
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    if editing.isEditing {
                        Button("Toggle", action: toggle)
                            .disabled(selection.isEmpty)
                    }
                    EditButton()
                }
                
            }
            .environment(\.editMode, $editing)
        }
    }
    
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
    
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(selected: .constant([.agave]))
            .environmentObject(Bar.preview)
    }
}
