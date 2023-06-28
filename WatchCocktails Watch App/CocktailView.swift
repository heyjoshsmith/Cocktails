//
//  CocktailView.swift
//  WatchCocktails Watch App
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

struct CocktailView: View {
    
    var cocktail: Cocktail
    
    init(_ cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var offset: CGFloat = .zero
    
    @State private var drinks = 1
    
    var body: some View {
        GeometryReader { frame in
            ZStack(alignment: .topLeading) {
                
                ScrollView {
                    LazyVStack {
                        
                        ZStack(alignment: .bottomLeading) {
                            
                            Image("\(cocktail.name)-Square")
                                .resizable()
                                .scaledToFill()
                                .frame(width: frame.size.width, height: frame.size.height, alignment: .center)
                                .clipped()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cocktail.name)
                                    Text(cocktail.flavorProfile)
                                        .foregroundColor(.white)
                                        .opacity(0.8)
                                        .font(.system(size: 10))
                                }
                                Spacer()
                            }
                            .font(.title3.weight(.bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.bottom, 20)
                            .backgroundGradient()
                        }
                        
                        VStack(spacing: 40) {
                            
                            numberOfDrinks
                            ingredientView
                            instructionsView
                            suppliesView
                            
                            NavigationLink("Learn More", destination: historyView)
                            
                        }
                        .padding()
                        
                    }
                    .background(GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            withAnimation {
                                offset = -proxy.frame(in: .named("scroll")).origin.y
                            }
                        }
                        return Color.clear
                    })
                }
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text(cocktail.category.name)
                        Spacer()
                    }
                }
                .buttonStyle(.plain)
                .padding(.top, 10)
                .padding(.leading, 10)
                .backgroundGradient([.bottom, .top])
                .padding(.bottom, 5)
                .background(offset < 115 ? .clear : .black)
                
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        .navigationTitle(cocktail.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden)
    }
    
    var numberOfDrinks: some View {
        VStack(spacing: 0) {
            
            Stepper("\(drinks)", value: $drinks, in: 1...100)
            
            Text("Number of Drinks")
                .font(.title3.weight(.bold))
                .onTapGesture {
                    drinks = 1
                }
            
        }
    }
    
    var ingredientView: some View {
        VStack(spacing: 5) {

            HStack {
                Text("Ingredients")
                    .font(.title3.weight(.bold))
                Spacer()
            }
            
            VStack {
                ForEach(cocktail.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text(ingredient.measurement(for: drinks))
                            .foregroundColor(.secondary)
                    }
                    if ingredient != cocktail.ingredients.last {
                        Divider()
                    }
                }
            }
            
        }
    }
    
    var instructionsView: some View {
        VStack(spacing: 5) {
            
            HStack {
                Text("Instructions")
                    .font(.title3.weight(.bold))
                Spacer()
            }
            
            VStack {
                ForEach(cocktail.instructions, id: \.self) { instruction in
                    
                    let number = cocktail.instructions.firstIndex(of: instruction)! + 1
                    
                    HStack(alignment: .top) {
                        Image(systemName: "\(number).circle.fill")
                            .foregroundColor(cocktail.category.color)
                        Text(instruction)
                        Spacer()
                    }
                    if instruction != cocktail.instructions.last {
                        Divider()
                    }
                }
            }
            
        }
    }
    
    var suppliesView: some View {
        VStack(spacing: 5) {
            
            HStack {
                Text("Supplies")
                    .font(.title3.weight(.bold))
                Spacer()
            }
            
            VStack {
                ForEach(cocktail.supplies, id: \.self) { item in
                    HStack(alignment: .top) {
                        Text(item.name)
                        Spacer()
                    }
                    if item != cocktail.supplies.last {
                        Divider()
                    }
                }
            }
            
        }
    }
    
    var historyView: some View {
        
        VStack(spacing: 0) {
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Label(cocktail.name, systemImage: "chevron.left")
                    Spacer()
                }
                .padding(.top, 15)
                .padding(.leading, 15)
                .padding(.bottom, 5)
            }
            .buttonStyle(.plain)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("History")
                            .font(.title3.weight(.bold))
                    }
                    
                    Text(cocktail.history)
                    
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    
}

struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CocktailView(.random)
        }
        .environmentObject(Bar.preview)
    }
}
