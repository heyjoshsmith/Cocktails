//
//  BartenderMiniView.swift
//  Cocktails
//
//  Created by Josh Smith on 3/20/24.
//

import SwiftData
import SwiftUI

struct BartenderMiniView: View {
    
    let cocktail = Cocktail("AMF")
    
    
    // State Variables
    
    @State private var ingredients = [Ingredient]()
    
    @State private var step = 0
    @State private var numberOfDrinks = 1
    
    var body: some View {
        
        Group {
            if let uiImage = UIImage(data: cocktail.imageData) {
                
                HStack {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 45))
                        .padding([.vertical, .leading])
                    TabView(selection: $step) {
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                Text("Ingredients")
                                    .font(.largeTitle.weight(.bold))
                                ForEach(cocktail.ingredients) { ingredient in
                                    button(for: ingredient)
                                }
                            }
                            .padding()
                            .padding(.bottom)
                        }
                        .scrollIndicators(.hidden)
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
                .background(Image(uiImage: uiImage).blur(radius: 50))
            }
        }
        .ignoresSafeArea()
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
        .padding()
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
    
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return NavigationStack {
        BartenderMiniView()
    }
    .environmentObject(Bar.shared)
    .modelContainer(container)
}
