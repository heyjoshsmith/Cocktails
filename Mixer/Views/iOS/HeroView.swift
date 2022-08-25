//
//  HeroView.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI

struct HeroView: View {
    
    var cocktail: Cocktail
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    var body: some View {
        GeometryReader { geo in
            NavigationLink {
                CocktailView(for: cocktail)
            } label: {
                ZStack(alignment: .bottomLeading) {
                    
                    cocktail.heroImage(width: geo.size.width, height: 225)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text(cocktail.name)
                            .font(.title.weight(.bold))
                            .foregroundColor(.white)
                        HStack {
                            Text(cocktail.flavorProfile)
                                .font(.headline)
                                .foregroundColor(.white)
                                .opacity(0.7)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    .padding([.vertical, .leading])
                    .backgroundGradient()
                }
                .frame(width: geo.size.width, height: 225, alignment: .center)
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(for: cocktails[0])
    }
}
