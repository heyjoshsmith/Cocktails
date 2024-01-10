//
//  ShareableView.swift
//  Mixer
//
//  Created by Josh Smith on 8/29/22.
//

import SwiftUI

struct ShareableView: View {
    
    var cocktail: Cocktail
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    @EnvironmentObject private var bar: Bar
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack(alignment: .bottomLeading) {
                
                cocktail.heroImage(width: 300, height: 200, alignment: .center)
                
                VStack(alignment: .leading) {
                    ViewThatFits {
                        Text(cocktail.name)
                            .font(.system(size: 30, weight: .bold))
                        Text(cocktail.name)
                            .font(.system(size: 25, weight: .bold))
                    }
                    ViewThatFits {
                        Text(cocktail.flavorProfile)
                            .font(.system(size: 17))
                        Text(cocktail.flavorProfile)
                            .font(.system(size: 15))
                    }
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, alignment: .bottomLeading)
                .background(LinearGradient(colors: [.clear, .black.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                
            }
            
            VStack(spacing: 10) {
                ForEach(cocktail.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                            .font(.system(size: 15, weight: .bold))
                        Spacer()
                        Text(ingredient.measurement)
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .background(Color.background2)
            
        }
        .frame(width: 300, alignment: .center)
//        .cornerRadius(10)
        
    }
    
}

struct ShareableView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ShareableView(for: Cocktail.example(of: "Cuba Libre"))
        }
        .preferredColorScheme(.dark)
    }
}
