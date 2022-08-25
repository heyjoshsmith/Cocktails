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
    
    @State private var rating: RatingType = .none
    
    var body: some View {
        NavigationLink(destination: CocktailView(for: cocktail)) {
            VStack(alignment: .leading) {
                
                ZStack(alignment: .topLeading) {
                    cocktail.squareImage(size: 155)
                        .cornerRadius(5)
                    
                    if rating != .none {
                        LinearGradient(colors: [.clear, .clear, .clear, .clear, .black.opacity(0.25), .black.opacity(0.55)], startPoint: .bottomTrailing, endPoint: .topLeading)
                    }
                    
                    ratingIcon
                        .transition(.scale)
                }
                .frame(width: 155, height: 155, alignment: .center)
                
                Text(cocktail.name)
                    .font(.footnote)
                    .foregroundColor(.primary)
                
            }
        }
        .onAppear(perform: load)
        .contextMenu {
            ForEach(RatingType.allCases, id: \.self) { rating in
                Button {
                    setCocktail(rating)
                } label: {
                    Label(rating.action, systemImage: rating.icon)
                }
            }
        } preview: {
            VStack {
                ZStack(alignment: .topLeading) {
                    heroPreview
                    ratingIcon
                        .scaleEffect(1.5)
                        .padding()
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
    
    func load() {
        withAnimation {
            if bar.likes.contains(cocktail.number) {
                rating = .liked
            } else if bar.dislikes.contains(cocktail.number) {
                rating = .disliked
            } else {
                rating = .none
            }
        }
    }
    
    func setCocktail(_ rating: RatingType) {
        withAnimation {
            bar.rate(cocktail, rating: rating)
            self.rating = rating
        }
    }
    
    var ratingIcon: some View {
        return Image(systemName: rating.icon)
            .symbolVariant(.fill)
        .font(.system(size: 13))
        .foregroundColor(.white)
        .frame(width: 25, height: 25, alignment: .center)
        .background(rating.color)
        .clipShape(Circle())
        .opacity(rating == .none ? 0 : 1)
        .padding(5)
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
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(cocktail: cocktails[3])
    }
}
