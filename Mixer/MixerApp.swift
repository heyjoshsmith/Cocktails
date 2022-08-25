//
//  MixerApp.swift
//  Mixer
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI

@main
struct MixerApp: App {
    
    @StateObject var bar: Bar

    init() {
        let bar = Bar.shared
        _bar = StateObject(wrappedValue: bar)
    }

    var body: some Scene {
        WindowGroup {
            CocktailList()
                .environment(\.managedObjectContext, bar.container.viewContext)
                .environmentObject(bar)
        }
    }
}
