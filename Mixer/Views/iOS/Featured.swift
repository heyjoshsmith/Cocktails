//
//  FeaturedCocktails.swift
//  Mixer
//
//  Created by Josh Smith on 8/25/22.
//

import SwiftUI

struct FeaturedCocktails: View {
    
    @AppStorage("Featured") var featured: [Int] = []
    @AppStorage("Featured Date") var featuredDate = Date()
    @State private var feature = 0
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $feature) {
            ForEach(featuredCocktails, id: \.self) { cocktail in

                ZStack(alignment: .topTrailing) {

                    HeroView(for: cocktail)
                        .tag(featuredCocktails.firstIndex(of: cocktail)!)

                    Button {
                        updateFeatured(forced: true)
                    } label: {
                        Image(systemName: "shuffle")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding()

                }
                .tag(featuredCocktails.firstIndex(of: cocktail)!)
                
            }
        }
        #if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: .never))
        #endif
        .frame(height: 225)
        .listRowInsets(EdgeInsets())
        .onReceive(timer, perform: swipe)
        .onAppear(perform: { updateFeatured() })
    }
    
    func updateFeatured(forced: Bool? = false) {
                
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: .now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let start = Calendar.current.date(from: components) ?? Date()
        components.hour = 23
        components.minute = 59
        components.second = 59
        let end = Calendar.current.date(from: components) ?? Date()
        
        let today = DateInterval(start: start, end: end)
        
        if !today.contains(featuredDate) || featured.isEmpty || forced! {
                        
            var results: [Int] = []
            
            while results.count < 5 {
                                
                if let item = cocktails.randomElement() {
                    if !results.contains(item.number) {
                                                
                        results.append(item.number)
                        
                    }
                }
            }
            
            featured = results
                        
            featuredDate = .now
        }
        
    }
    
    func swipe(timer: Date) {
                
        withAnimation {
            if feature < 4 {
                feature = feature + 1
            } else {
                feature = 0
            }
        }
    }
    
    var featuredCocktails: [Cocktail] {
        
        var results = [Cocktail]()
        
        for number in featured {
            results.append(cocktails[number - 1])
        }
        
        return results
    }
    
}

struct FeaturedCocktails_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCocktails()
    }
}
