//
//  CategoryItem.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI
import CoreData

struct CategoryItem: View {
    
    @EnvironmentObject private var bar: Bar
    
    var cocktail: Cocktail
    @State private var xOffset: Double = 0
    @State private var yOffset: Double = 0
    
    @State private var editing = false
        
    @State private var isActive = false
    
    var body: some View {
        VStack {
            NavigationLink(value: cocktail) {
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .topLeading) {
                        
                        #if os(visionOS)
                        cocktail.circleImage(size: 155)
                        #else
                        cocktail.squareImage(size: 155)
                            .cornerRadius(5)
                        #endif
                        
                        LinearGradient(colors: [.clear, .clear, .clear, .clear, .black.opacity(0.25), .black.opacity(0.55)], startPoint: .bottomTrailing, endPoint: .topLeading)

                    }
                    .frame(width: 155, height: 155, alignment: .center)
                    
                    #if !os(visionOS)
                    textLabel
                    #endif
                    
                }
            }
            #if os(visionOS)
            .buttonBorderShape(.circle)
            #endif
            
            #if os(visionOS)
            textLabel
            #endif
            
        }

    }
    
    var textLabel: some View {
        Text(cocktail.name)
            .font(.footnote)
            .foregroundColor(.primary)
    }
        
    var heroPreview: some View {
        ZStack(alignment: .bottomLeading) {
            
            cocktail.heroImage(height: 225, alignment: .center)
            
            VStack(alignment: .leading) {
                Spacer()
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
            .frame(height: 225, alignment: .center)
            
        }
    }
    
    func preview() -> some View {
        return VStack {
            ZStack(alignment: .topLeading) {
                heroPreview
            }
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title2.weight(.bold))
                    .padding(.bottom, 5)
                VStack(spacing: 5) {
                    ForEach(cocktail.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                            Spacer()
                            Text(ingredient.measurement)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(cocktail: cocktails[3])
    }
}
