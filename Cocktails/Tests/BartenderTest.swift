//
//  BartenderTest.swift
//  Cocktails
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

struct BartenderTest: View {
    
    var cocktail: Cocktail
    
    init(_ cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    @State private var step = 0
    @State private var drinks = 1
    @State private var showingIngredients = true
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { frame in
            ZStack {
                
                cocktail.category.gradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 30) {
                            
                            Image("\(cocktail.name)-Square")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .padding(3)
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 75, height: 75, alignment: .center)
                            
                            Text(cocktail.name)
                                .font(.system(size: 75, weight: .bold))
                        }
                    }
                    
                    if showingIngredients {
                        ingredients(frame)
                            .transition(.move(edge: .leading))
                    }
                    
                    if !showingIngredients {
                        instructions
                            .transition(.move(edge: .trailing))
                    }
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                
            }
            .foregroundColor(.white)
        }
        .onTapGesture {
            withAnimation {
                showingIngredients.toggle()
            }
        }
    }
    
    func ingredients(_ frame: GeometryProxy) -> some View {
        
        var size: CGFloat {
            return (frame.size.width - (30 + ((landscape ? 4 : 2) * 10))) / (landscape ? 5 : 3)
        }
        
        var landscape: Bool {
            return frame.size.width > frame.size.height
        }
        
        var columns: Int {
            if landscape && cocktail.ingredients.count >= 5 {
                return 5
            } else {
                return 3
            }
        }
        
        return VStack(spacing: 25) {
            
            Spacer()
            
            Text("Ingredients")
                .font(.system(size: 50, weight: .bold))
            
            LazyVGrid(columns: Columns(columns), spacing: 10) {
                ForEach(cocktail.ingredients) { ingredient in
                    VStack {
                        Text(ingredient.measurement(for: drinks))
                            .font(.system(size: 40, weight: .bold))
                        Text(ingredient.name)
                            .font(.system(size: 25))
                    }
                    .padding()
                    .frame(width: size, height: size, alignment: .center)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                }
            }
            .frame(width: (Double(columns) * Double(size)) + Double((columns - 1) * 10))
            
//            VStack(spacing: 15) {
//                ForEach(cocktail.ingredients) { ingredient in
//                    HStack {
//                        Text(ingredient.name)
//                        Spacer()
//                        Text(ingredient.measurement(for: drinks))
//                    }
//                    .font(.title)
//                }
//            }
//            .padding(.horizontal, 30)
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
    
    var instructions: some View {
        TabView(selection: $step) {
            ForEach(cocktail.instructions, id: \.self) { step in
                Text(step)
                    .font(.system(size: 50, weight: .bold))
                    .multilineTextAlignment(.center)
                    .tag(cocktail.instructions.firstIndex(of: step)!)
                    .padding(.horizontal, 30)
            }
            
            VStack {
                Image(systemName: "party.popper.fill")
                    .font(.system(size: 150, weight: .bold))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow, .blue)
                Text("Done!")
                    .font(.system(size: 100, weight: .bold))
            }
            .tag(cocktail.instructions.count)
            .padding(.horizontal, 30)
            
        }
        .tabViewStyle(.page)
    }
    
}

struct BartenderTest_Previews: PreviewProvider {
    static var previews: some View {
        BartenderTest(.random)
    }
}
