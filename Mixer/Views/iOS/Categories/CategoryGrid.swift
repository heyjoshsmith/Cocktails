//
//  CategoryGrid.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/27/22.
//

import SwiftUI

struct CategoryGrid: View {
    
    var category: CocktailCategory
    
    init(for category: CocktailCategory) {
        self.category = category
    }
    
    @EnvironmentObject private var bar: Bar
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns(geo: geo), spacing: 10) {
                    ForEach(category.recipes) { cocktail in
                        if filterIncludes(cocktail) {
                            NavigationLink {
                                CocktailView(for: cocktail)
                            } label: {
                                ZStack(alignment: .topLeading) {
                                    if rating(for: cocktail) != .none {
                                        LinearGradient(colors: [.clear, .clear, .clear, .clear, .black.opacity(0.25), .black.opacity(0.55)], startPoint: .bottomLeading, endPoint: .topTrailing)
                                    }
                                    gridItem(for: cocktail, geo: geo)
                                    
                                    ratingIcon(for: cocktail)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(category.name)
        }
        .background(Color.background)
    }
    
    func gridItem(for cocktail: Cocktail, geo: GeometryProxy) -> some View {
        
        var size: CGFloat {
            return (geo.size.width - (15 * CGFloat(columns(geo: geo).count)) - 15) / CGFloat(columns(geo: geo).count)
        }
        
        return ZStack(alignment: .bottomLeading) {
            
            cocktail.squareImage(size: size)
                .cornerRadius(10)
            
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
            .background(LinearGradient(colors: [category.color.opacity(0), category.color.opacity(0), category.color.opacity(0.25), category.color.opacity(0.5), category.color.opacity(0.75)], startPoint: .top, endPoint: .bottom))
            
        }
        .frame(width: size, height: size, alignment: .center)
        .cornerRadius(10)
    }
    
    func filterIncludes(_ cocktail: Cocktail) -> Bool {
        
        let liked = bar.likes.contains(cocktail.number)
        let disliked = bar.dislikes.contains(cocktail.number)
        
        switch bar.filter {
        case .liked:
            return liked
        case .disliked:
            return disliked
        case .notRated:
            return !liked && !disliked
        case .none:
            return true
        default:
            return true
        }
    }
    
    func rating(for cocktail: Cocktail) -> RatingType {
        if bar.likes.contains(cocktail.number) {
            return .liked
        } else if bar.dislikes.contains(cocktail.number) {
            return .disliked
        } else {
            return .none
        }
    }
    
    func ratingIcon(for cocktail: Cocktail) -> some View {
        
        return Image(systemName: rating(for: cocktail).icon)
            .symbolVariant(.fill)
            .font(.system(size: 13))
            .foregroundColor(.white)
            .frame(width: 25, height: 25, alignment: .center)
            .background(rating(for: cocktail).color)
            .clipShape(Circle())
            .opacity(rating(for: cocktail) == .none ? 0 : 1)
            .padding(5)
    }
    
    enum Device {
        case iPhone, iPad, watch, mac, tv
    }
    
    var device: Device {
        
        #if os(iOS)
        let type = UIDevice.current.userInterfaceIdiom
        
        switch type {
        case .pad: return .iPad
        default: return .iPhone
        }
        
        #elseif os(macOS)
        return .mac
        #elseif os(tvOS)
        return .tv
        #else
        return .watch
        #endif
        
    }
    
    func columns(geo: GeometryProxy) -> Columns {
        if device == .iPad || geo.size.width > geo.size.height {
            return Columns(4)
        } else {
            return Columns(2)
        }
    }
    
}

struct CategoryGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryGrid(for: .gin)
        }
        .environmentObject(Bar.preview)
    }
}
