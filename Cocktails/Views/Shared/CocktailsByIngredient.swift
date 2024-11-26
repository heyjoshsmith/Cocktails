//
//  CocktailsByIngredient.swift
//  Cocktails
//
//  Created by Josh Smith on 8/30/22.
//

import SwiftUI
import SwiftData

struct CocktailsByIngredient: View {
    
    @State private var ingredientList = [IngredientType]()
    @State private var choosingIngredients = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                
                Section("Ingredients") {
                    
                    ForEach(ingredientList) { ingredient in
                        Text(ingredient.name)
                            .swipeActions {
                                Button("Delete", systemImage: "trash") {
                                    ingredientList.removeAll { item in
                                        item == ingredient
                                    }
                                }
                                .tint(.red)
                            }
                    }
                    
                    Button("Add Ingredient", systemImage: "plus") {
                        choosingIngredients.toggle()
                    }
                    .sheet(isPresented: $choosingIngredients) {
                        IngredientPicker(selected: $ingredientList)
                    }
                    
                }
                
                Section {
                    ForEach(results) { cocktail in
                        NavigationLink(destination: CocktailView(for: cocktail)) {
                            HStack {
                                
                                cocktail.squareImage(size: 50)
                                    .cornerRadius(5)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(cocktail.name)
                                        .fontWeight(.medium)
                                    
                                    Group {
                                        if remainingIngredients(from: cocktail).isEmpty {
                                            HStack {
                                                Text("All ingredients available!")
                                                Image(systemName: "checkmark.seal.fill")
                                                    .foregroundColor(.green)
                                            }
                                        } else {
                                            Text(remainingIngredients(from: cocktail))
                                        }
                                    }
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    
                                }
                                
                            }
                        }
                    }
                }

            }
            .navigationTitle("Cocktails")
            .toolbar {
                #if !os(visionOS)
                ToolbarItem(placement: .cancellationAction) {
                    if (!ingredientList.isEmpty) {
                        Button("Clear") {
                            withAnimation {
                                ingredientList.removeAll()
                            }
                        }
                    }
                }
                #endif
            }
        }
    }
    
    var results: [Cocktail] {
        return cocktails.filter { cocktail in
            Set(ingredientList).isSubset(of: Set(cocktail.ingredients.map { $0.kind }))
        }.sorted { lhs, rhs in
            (remaining(for: lhs).count, lhs.name) < (remaining(for: rhs).count, rhs.name)
        }
    }
    
    func remaining(for cocktail: Cocktail) -> [IngredientType] {
        return cocktail.ingredients.map { $0.kind }.filter { ingredient in
            !ingredientList.contains(ingredient) && ingredient.units != UnitGarnish.garnish
        }
    }
    
    func remainingIngredients(from cocktail: Cocktail) -> String {
        let remaining = remaining(for: cocktail)
        return ListFormatter.localizedString(byJoining: remaining.map { $0.name })
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return Text("")
        .sheet(isPresented: .constant(true)) {
            CocktailsByIngredient()
        }
        .environmentObject(Bar.shared)
        .modelContainer(container)
}
