//
//  BartenderTest.swift
//  Cocktails
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI
import SwiftData

struct BartenderView: View {
    
    init(_ cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    var cocktail: Cocktail
    
    
    // State Variables
    
    @State private var ingredients = [Ingredient]()
    
    @State private var step = 0
    @State private var numberOfDrinks = 1
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Group {
                    
                    #if os(visionOS)
                    cocktail.category.gradient
                        .edgesIgnoringSafeArea(.all)
                    #else
                    if let uiImage = UIImage(data: cocktail.imageData) {
                        Image(uiImage: uiImage)
                            .scaledToFill()
                    }
                    #endif
                }
                
                HStack(spacing: 0) {
                    
                    Image("\(cocktail.name)-Square")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.leading)
                        .padding(.bottom)
                    
                    TabView(selection: $step) {
                        
                        VStack(alignment: .leading) {
                            Text("Ingredients")
                                .padding(.horizontal)
                                #if os(visionOS)
                                .font(.extraLargeTitle)
                                #else
                                .font(.largeTitle)
                                #endif
                            ScrollView {
                                VStack(alignment: .leading) {
                                    ForEach(cocktail.ingredients) { ingredient in
                                        button(for: ingredient)
                                    }
                                }
                                .padding(.bottom)
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .tag(0)
                        
                        ForEach(cocktail.instructions, id: \.self) { step in
                            instruction(for: step)
                        }
                        
                        VStack {
                            Image(systemName: "party.popper.fill")
                                .font(.system(size: 125, weight: .bold))
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.yellow, .blue)
                            Text("Done!")
                                .font(.system(size: 75, weight: .bold))
                        }
                        .tag(cocktail.instructions.count + 1)
                        .padding(.horizontal, 30)
                        
                    }
                    .tabViewStyle(.page)
                    
                }
                .padding([.horizontal, .bottom])
                .background(.ultraThinMaterial)
                
            }
            .navigationTitle(cocktail.name)
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                #if os(visionOS)
                ToolbarItem(placement: .bottomOrnament) {
                    bottomBar
                }
                #else
                ToolbarItem(placement: .bottomBar) {
                    bottomBar
                }
                #endif
                
            }
        }
        
    }
    
    
    // Additional Views
    
    func instruction(for step: String) -> some View {
        
        var scaledStep = step
        
        for ingredient in cocktail.ingredients {
            if ingredient.amount > 0 {
                scaledStep = scaledStep.replacingOccurrences(of: ingredient.name, with: "\(ingredient.measurement(for: numberOfDrinks)) \(ingredient.name)\(ingredient.amount(for: numberOfDrinks) == 1 ? "" : "s")")
            }
        }
        
        
        return ScrollView {
            Text(scaledStep)
                .font(.system(size: 50, weight: .bold))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
        }
        .multilineTextAlignment(.center)
        .tag(cocktail.instructions.firstIndex(of: step)! + 1)
        .padding(.horizontal, 30)
        .frame(maxHeight: .infinity, alignment: .center)
        .padding(.bottom)
    }
    
    func button(for ingredient: Ingredient) -> some View {
        Button {
            withAnimation {
                if ingredients.contains(ingredient) {
                    ingredients.removeAll { existing in
                        existing == ingredient
                    }
                } else {
                    ingredients.append(ingredient)
                }
            }
        } label: {
            HStack(alignment: .top) {
                Image(systemName: ingredients.contains(ingredient) ? "checkmark" : "circle")
                Text(ingredient.name)
                    .fontWeight(.regular)
            }
            .font(.title)
            .padding(.horizontal)
        }
        .buttonStyle(.plain)
        .hoverEffect()
    }
    
    var ingredientsView: some View {
        HStack {
            
            Image("\(cocktail.name)-Square")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 15))
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .padding(.horizontal)
                    #if os(visionOS)
                    .font(.extraLargeTitle)
                    #else
                    .font(.largeTitle)
                    #endif
                ViewThatFits {
                    VStack(alignment: .leading) {
                        ForEach(cocktail.ingredients) { ingredient in
                            button(for: ingredient)
                        }
                        Spacer()
                    }
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(cocktail.ingredients) { ingredient in
                                button(for: ingredient)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
        }
        .padding([.horizontal, .bottom])
    }
    
    var bottomBar: some View {
        HStack(spacing: 25) {
            
            Button("Decrease", systemImage: "minus") {
                withAnimation(.bouncy) {
                    numberOfDrinks -= 1
                }
            }
            .labelStyle(.iconOnly)
            .disabled(numberOfDrinks == 1)
            
            TextField(
                "Number of Drinks",
                value: $numberOfDrinks,
                format: .number.precision(.fractionLength(0))
            )
            .frame(maxWidth: 50)
            .multilineTextAlignment(.center)
            
            Button("Increase", systemImage: "plus") {
                withAnimation(.bouncy) {
                    numberOfDrinks += 1
                }
            }
            .labelStyle(.iconOnly)
            
        }
        .font(.title)
    }
    
    
    // Environment
    
    @Environment(\.dismiss) private var dismiss
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return NavigationStack {
        BartenderView(Cocktail("Wisconsin Old Fashioned"))
    }
    .environmentObject(Bar.shared)
    .modelContainer(container)
}
