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
        
        print("Comment (func updateFeatured): Updating Featured Cocktails")
        
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
            
            print("Comment (func updateFeatured): Last Updated on \(featuredDate.formatted(date: .abbreviated, time: .shortened)).")
            
            var results: [Int] = []
            
            while results.count < 5 {
                
                print("Comment (func updateFeatured): Adding featured item #\(results.count + 1).")
                
                if let item = cocktails.randomElement() {
                    if !results.contains(item.number) {
                        
                        print("Comment (func updateFeatured): Adding \(item.name) to featured list.")
                        
                        results.append(item.number)
                        
                    } else {
                        print("Comment (func updateFeatured): \(item.name) is already featured.")
                    }
                } else {
                    print("Comment (func updateFeatured): Error finding cocktail to feature.")
                }
            }
            
            featured = results
            
            print("Comment (func updateFeatured): Finished updating Featured Cocktails. Saving date now.")
            
            featuredDate = .now
        } else {
            if today.contains(featuredDate) {
                print("Comment (func updateFeatured): Featured Cocktails list was updated earlier today.")
            }
        }
        
    }
    
    func swipe(timer: Date) {
        
        print("Comment (func swipe): Showing Feature #\(feature + 1).")
        
        withAnimation {
            if feature < 4 {
                print("Comment (func swipe): Moving to next feature.")
                feature = feature + 1
            } else {
                print("Comment (func swipe): Starting over.")
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
