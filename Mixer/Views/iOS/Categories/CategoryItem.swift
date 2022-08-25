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
                }
                
                Text(cocktail.name)
                    .font(.footnote)
                    .foregroundColor(.primary)
                
            }
        }
        .onAppear(perform: load)

    }
    
    func load() {
        if bar.likes.contains(cocktail.number) {
            rating = .liked
        } else if bar.dislikes.contains(cocktail.number) {
            rating = .disliked
        } else {
            rating = .none
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
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(cocktail: cocktails[3])
    }
}
