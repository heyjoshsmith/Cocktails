//
//  CocktailsApp.swift
//  Cocktails
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI

@main
struct CocktailsApp: App {
    
    @StateObject var bar: Bar

    init() {
        let bar = Bar.shared
        _bar = StateObject(wrappedValue: bar)
    }

    var body: some Scene {
        WindowGroup {
            Group {
                #if os(visionOS)
                VisionHome()
                #else
                HomeView()
                #endif
            }
            .modelContainer(for: [Cocktail.self, Guest.self])
            .environmentObject(bar)
            .onAppear(perform: bar.loadSearch)
        }
    }
    
}
