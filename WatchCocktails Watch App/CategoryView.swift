//
//  CategoryView.swift
//  WatchCocktails Watch App
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var category: CocktailCategory
    
    init(_ category: CocktailCategory) {
        self.category = category
    }
    
    @State private var listView = false
    
    fileprivate func cocktailRow(_ cocktail: Cocktail) -> some View {
        return HStack(spacing: 10) {
            
            cocktail.squareImage(size: 40)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(cocktail.name)
                    .fontWeight(.bold)
                Text(cocktail.flavorProfile)
                    .foregroundColor(.secondary)
                    .font(.system(size: 10))
            }
            
        }
    }
    
    fileprivate func cocktailCard(_ cocktail: Cocktail) -> some View {
        return NavigationLink(value: cocktail) {
            ZStack(alignment: .bottomLeading) {
                
                Image("\(cocktail.name)-Hero")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
                VStack(alignment: .leading) {
                    
//                    Text(cocktail.category.name)
//                        .font(.system(size: 10, weight: .semibold))
//                        .padding(.vertical, 3)
//                        .padding(.horizontal, 7)
//                        .foregroundColor(.white)
//                        .background(cocktail.category.color)
//                        .clipShape(Capsule())
                    
                    HStack {
                        Text(cocktail.name)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Text(cocktail.flavorProfile)
                        .foregroundColor(.white)
                        .font(.system(size: 10))
                        .opacity(0.8)
                }
                .shadow(radius: 5)
                .padding(10)
                .backgroundGradient()

            }
        }
        .buttonStyle(.plain)
        .cornerRadius(20)
        .listRowInsets(EdgeInsets())
    }
    
    @State private var selected = 0.0
    
    var body: some View {
//        GeometryReader { frame in
//            ZStack(alignment: .topLeading) {
                
                List {
                    ForEach(category.recipes) { cocktail in
                        cocktailCard(cocktail)
                    }
                }
                .listStyle(.carousel)
                
//                digitalCrownView
                
//                scrollView
                
//                Button {
//                    dismiss()
//                } label: {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("Categories")
//                        Spacer()
//                    }
//                }
//                .buttonStyle(.plain)
//                .padding(.top, 10)
//                .padding(.leading, 10)
//                .backgroundGradient([.bottom, .top])
                
//            }
//        }
//        .edgesIgnoringSafeArea(.vertical)
        .navigationTitle(category.name)
//        .toolbar(.visible)
        
    }
    
    var digitalCrownView: some View {
        Group {
            ForEach(category.recipes) { cocktail in
                if cocktail == category.recipes[Int(selected)] {
                    cocktailCard(cocktail)
                        .focusable()
                        .transition(.scale)
                }
            }
        }
        .digitalCrownRotation($selected, from: 0.0, through: Double(category.recipes.count - 1), by: 1, sensitivity: .low)
    }
    
    func scrollView(with frame: GeometryProxy) -> some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(category.recipes) { cocktail in
                    if listView {
                        cocktailRow(cocktail)
                    } else {
                        cocktailCard(cocktail)
                            .frame(width: frame.size.width, height: frame.size.height, alignment: .center)
                    }
                }
            }
        }
    }
    
    var selectedCocktail: Cocktail {
        if selected <= 0 {
            return category.recipes.first!
        } else if selected >= Double(category.recipes.count - 1) {
            return category.recipes.last!
        } else {
            return category.recipes[Int(selected.rounded(.towardZero))]
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryView(.tequila)
        }
    }
}
