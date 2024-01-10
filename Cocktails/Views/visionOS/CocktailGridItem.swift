//
//  CocktailGridItem.swift
//  Cocktails
//
//  Created by Josh Smith on 1/10/24.
//

import SwiftUI

struct CocktailGridItem: View {
    
    var cocktail: Cocktail
    var size: CGFloat
    
    init(_ cocktail: Cocktail, with size: CGFloat) {
        self.cocktail = cocktail
        self.size = size
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            cocktail.squareImage(size: size)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                
                Spacer()
                HStack {
                    Text(cocktail.name)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Text(cocktail.flavorProfile)
                    .font(.caption2)
                    .opacity(0.7)
                    .multilineTextAlignment(.leading)
            }
            .foregroundColor(.white)
            .padding([.leading, .vertical], 10)
            .gradient(for: cocktail)
            
        }
        .frame(width: size, height: size, alignment: .center)
        .cornerRadius(12)
    }
    
}
