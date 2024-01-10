//
//  CocktailsByIngredient.swift
//  Mixer
//
//  Created by Josh Smith on 8/30/22.
//

import SwiftUI

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
                                Button {
                                    ingredientList.removeAll { item in
                                        item == ingredient
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                            }
                    }
                    Button {
                        choosingIngredients.toggle()
                    } label: {
                        Label("Add Ingredient", systemImage: "plus")
                    }
                    .sheet(isPresented: $choosingIngredients) {
                        IngredientsView(selected: $ingredientList)
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
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
//                            Image(systemName: "chevron.left")
                            Text("Done")
                        }
//                            .font(.system(size: 20))
//                            .foregroundColor(Color.label3)
                    }
                }
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

struct CocktailsByIngredient_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsByIngredient()
    }
}
