//
//  LargeCocktailView.swift
//  Cocktails
//
//  Created by Josh Smith on 3/10/22.
//

import SwiftUI

struct LargeCocktailView: View {
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isFocused) private var focused: Bool
    
    @State private var isLiked = false
    @State private var isDisliked = false
    
    @State private var upColor: Color?
    @State private var downColor: Color?
    
    var cocktail: Cocktail
    @Binding var viewing: Cocktail?
    
    init(for cocktail: Cocktail, viewing: Binding<Cocktail?>) {
        self.cocktail = cocktail
        self._viewing = viewing
    }
    
    @State private var numberOfDrinks = 1
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                
                cocktail.heroImage(width: geo.size.width, height: geo.size.height)
                
                HStack(alignment: .top, spacing: viewSpacing) {
                    
                    VStack(alignment: .leading) {
                        
                        if bar.device == .iPad || bar.device == .mac {
                            Button {
                                withAnimation {
                                    viewing = nil
                                    dismiss()
                                }
                            } label: {
                                Label("Home", systemImage: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: size(tv: 0, mac: 20, iPad: 15)))
                            }
                            .buttonStyle(.plain)
                            .padding([.leading, .top])
                        }
                        
                        Group {
                            if bar.device == .iPhone {
                                smallScreenView(size: geo)
                            } else {
                                largeScreenView(size: geo)
                            }
                        }
                        .frame(width: geo.size.width / 3, alignment: .top)
                        .padding([.vertical, .leading], size(tv: 75, mac: 0))
                        .padding(.leading, size(tv: 0, mac: 35, iPad: 15))
                        
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 25) {
                            
                            if bar.device != .iPhone {
                                details
                                
                                Divider()
                            }
                            
                            ingredients
                            
                            Divider()
                            
                            instructions
                            
                            Divider()
                            
                            supplies
                            
                        }
                        .padding([.vertical, .trailing], size(tv: 0, mac: 25, iPad: 20, iPhone: 10))
                        .padding(.vertical, size(tv: 0, mac: 25, iPad: 20, iPhone: 10))
                        
                    }
                    .padding([.vertical, .trailing], size(tv: 75, mac: 0, iPhone: 0))
                    
                }
                .background(Color.black.opacity(0.5))
                .background(.ultraThinMaterial)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
            }
            .navigationTitle(cocktail.name)
            #if !os(macOS)
            .navigationBarHidden(true)
            #endif
            
        }
        .onAppear(perform: load)
    }
    
    func load() {
        if bar.likes.contains(cocktail.number) {
            isLiked = true
        }
        if bar.dislikes.contains(cocktail.number) {
            isDisliked = true
        }
    }
    
    func like() {
        withAnimation {
            if bar.likes.contains(cocktail.number) {
                bar.rate(cocktail, rating: .none)
                self.isLiked = false
            } else {
                bar.rate(cocktail, rating: .liked)
                self.isLiked = true
                self.isDisliked = false
            }
        }
    }
    
    func dislike() {
        withAnimation {
            if bar.dislikes.contains(cocktail.number) {
                bar.rate(cocktail, rating: .none)
                self.isDisliked = false
            } else {
                bar.rate(cocktail, rating: .disliked)
                self.isDisliked = true
                self.isLiked = false
            }
        }
    }
    
    func increase() {
        withAnimation {
            numberOfDrinks += 1
            upColor = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                upColor = nil
            }
            print("Comment (func increase): Increased to \(numberOfDrinks)")
        }
    }
    
    func decrease() {
        withAnimation {
            if numberOfDrinks > 1 {
                numberOfDrinks -= 1
                downColor = .red
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    downColor = nil
                }
            }
        }
    }
    
    var firstColumnPadding: CGFloat {
        return bar.device == .tv ? 75 : 25
    }
    
    var viewSpacing: CGFloat {
        switch bar.device {
        case .tv: return 100
        case .mac: return 50
        default: return 25
        }
    }
    
    func size(tv: CGFloat, mac: CGFloat, iPad: CGFloat? = nil, iPhone: CGFloat? = nil) -> CGFloat {
        
        var result: CGFloat? = 0
        
        switch bar.device {
        case .tv: result = tv
        case .mac: result = mac
        case .iPad: result = iPad
        case .iPhone: result = iPhone
        default: result = 0
        }
        
        return result ?? 0
        
    }
    
    func heroImage(size geo: GeometryProxy) -> some View {
        cocktail.squareImage(size: geo.size.width / 3)
            .cornerRadius(size(tv: 20, mac: 10, iPad: 10, iPhone: 10))
            .padding(.bottom, size(tv: 35, mac: 15, iPad: 15, iPhone: 0))
    }
    
    func largeScreenView(size geo: GeometryProxy) -> some View {
        return ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                heroImage(size: geo)
                
                Text("History")
                    .font(.system(size: size(tv: 40, mac: 30, iPad: 20), weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, size(tv: 0, mac: 5))
                
                Text(cocktail.history)
                    .font(.system(size: size(tv: 25, mac: 20, iPad: 15)))
                    .foregroundColor(.white)
                
            }
            .multilineTextAlignment(.leading)
            .frame(width: geo.size.width / 3)
            .padding(.vertical, size(tv: 0, mac: 15))
        }
    }
    
    func smallScreenView(size geo: GeometryProxy) -> some View {
        
        VStack {
            Spacer()
            heroImage(size: geo)
            
            HStack(spacing: 15) {
                
                Text(cocktail.name)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: like) {
                    Image(systemName: "hand.thumbsup")
                        .symbolVariant(isLiked  ? .fill : .none)
                        .frame(width: 5, height: 5, alignment: .center)
                        .rotationEffect(.degrees(isLiked  ? 0 : 360))
                        .animation(.spring(), value: isLiked)
                }
                .buttonStyle(TVButtonStyle(color: isLiked ? .green : nil, mac: bar.device == .iPhone))
                .transition(.scale)
                
                Button(action: dislike) {
                    Image(systemName: "hand.thumbsdown")
                        .symbolVariant(isDisliked  ? .fill : .none)
                        .frame(width: 5, height: 5, alignment: .center)
                        .rotationEffect(.degrees(isDisliked  ? 0 : 360))
                        .animation(.spring(), value: isDisliked)
                }
                .buttonStyle(TVButtonStyle(color: isDisliked ? .red : nil, mac: bar.device == .iPhone))
                .transition(.scale)
                
            }
            
            Text(cocktail.flavorProfile)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .opacity(0.7)
            
            Spacer()
            
        }
        
    }
    
    var details: some View {
        
        var title: String {
            let strings = cocktail.tip.components(separatedBy: ": ")
            return strings.first ?? "Info"
        }
        
        var text: String {
            let strings = cocktail.tip.components(separatedBy: ": ")
            return strings.last ?? "Info"
        }
        
        return VStack(alignment: .leading) {
            
            HStack(spacing: size(tv: 25, mac: 25, iPad: 10, iPhone: 10)) {
                
                Text(cocktail.name)
                    .font(.system(size: size(tv: 75, mac: 40, iPad: 35, iPhone: 35), weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: like) {
                    Image(systemName: "hand.thumbsup")
                        .symbolVariant(isLiked  ? .fill : .none)
                        .frame(width: buttonFrame, height: buttonFrame, alignment: .center)
                        .rotationEffect(.degrees(isLiked  ? 0 : 360))
                        .animation(.spring(), value: isLiked)
                }
                .buttonStyle(TVButtonStyle(color: isLiked ? .green : nil, mac: bar.device != .tv))
                .transition(.scale)
                
                Button(action: dislike) {
                    Image(systemName: "hand.thumbsdown")
                        .symbolVariant(isDisliked  ? .fill : .none)
                        .frame(width: buttonFrame, height: buttonFrame, alignment: .center)
                        .rotationEffect(.degrees(isDisliked  ? 0 : 360))
                        .animation(.spring(), value: isDisliked)
                }
                .buttonStyle(TVButtonStyle(color: isDisliked ? .red : nil, mac: bar.device != .tv))
                .transition(.scale)
                
            }
            
            Text(cocktail.flavorProfile)
                .font(.system(size: size(tv: 40, mac: 25, iPad: 20, iPhone: 20)))
                .foregroundColor(.white)
                .opacity(0.7)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom)
            
            Text(title)
                .font(.system(size: sectionTitle, weight: .bold))
                .foregroundColor(.white)
            
            Text(text)
                .font(.system(size: textSize))
                .foregroundColor(.white)
                .opacity(0.7)
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .buttonStyle(PlainNavigationLinkButtonStyle())
        
    }
    
    var sectionTitle: CGFloat {
        size(tv: 55, mac: 30, iPad: 20, iPhone: 25)
    }
    
    var buttonFrame: CGFloat {
        size(tv: 30, mac: 10, iPhone: 1)
    }
    
    var textSize: CGFloat {
        size(tv: 40, mac: 20, iPad: 15, iPhone: 20)
    }
    
    var ingredients: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: size(tv: 25, mac: 25, iPad: 15, iPhone: 10)) {

                Text("Ingredients")
                    .font(.system(size: sectionTitle, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Serves \(numberOfDrinks)")
                    .font(.system(size: sectionTitle, weight: .bold))
                    .padding(.trailing, 15)
                
                Button(action: increase) {
                    Image(systemName: "plus")
                        .frame(width: buttonFrame, height: buttonFrame, alignment: .center)
                }
                .buttonStyle(TVButtonStyle(color: upColor, mac: bar.device != .tv))
                .scaleEffect(upColor == nil ? 1 : 1.1)
                .animation(.easeInOut(duration: 0.1), value: upColor)
                
                Button(action: decrease) {
                    Image(systemName: "minus")
                        .frame(width: buttonFrame, height: buttonFrame, alignment: .center)
                }
                .buttonStyle(TVButtonStyle(color: downColor, mac: bar.device != .tv))
                .scaleEffect(downColor == nil ? 1 : 1.1)
                .animation(.easeInOut(duration: 0.1), value: downColor)
                .opacity(numberOfDrinks == 1 ? 0.5 : 1)
                
            }
            .padding(.bottom, size(tv: 35, mac: 0))

            VStack(spacing: 25) {
                ForEach(cocktail.ingredients, id: \.self) { ingredient in
                    
                    Button(action: {}) {
                        HStack(alignment: .top) {
                            Text(ingredient.name)
                            Spacer()
                            Text(ingredient.measurement(for: numberOfDrinks))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                        .font(.system(size: textSize))
                    }
                    .buttonStyle(HighlightNavigationLinkButtonStyle())
                    
                }
            }
            
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
        .buttonStyle(PlainNavigationLinkButtonStyle())
        
    }
    
    var instructions: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            
            Text("Instructions")
                .font(.system(size: sectionTitle, weight: .bold))
                .padding(.bottom, size(tv: 35, mac: 0))

            VStack(spacing: 25) {
                ForEach(cocktail.instructions, id: \.self) { instruction in
                    
                    if let index = cocktail.instructions.firstIndex(of: instruction) {
                        Button(action: {}) {
                            HStack(alignment: .top, spacing: 10) {
                                Text("\(index + 1).")
                                    .frame(width: size(tv: 60, mac: 20, iPad: 15, iPhone: 20), alignment: .leading)
                                Text(instruction)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Spacer()
                            }
                            .font(.system(size: textSize))
                        }
                        .buttonStyle(HighlightNavigationLinkButtonStyle())

                    }
                    
                }
            }
            
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
        .buttonStyle(PlainNavigationLinkButtonStyle())
        
    }
    
    var supplies: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            
            Text("Supplies")
                .font(.system(size: sectionTitle, weight: .bold))
                .padding(.bottom, size(tv: 35, mac: 0))
            
            VStack(spacing: 25) {
                ForEach(cocktail.supplies, id: \.self) { item in
                    
                    Button(action: {}) {
                        HStack {
                            Text(item.name)
                                .font(.system(size: textSize))
                            Spacer()
                        }
                    }
                    .buttonStyle(HighlightNavigationLinkButtonStyle())
                    
                }
            }
            
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
        .buttonStyle(PlainNavigationLinkButtonStyle())
        
    }
    
}

struct LargeCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        LargeCocktailView(for: Cocktail.example(of: "Martini"), viewing: .constant(nil))
            .environmentObject(Bar.preview)
    }
}
