//
//  MixerApp.swift
//  Mixer
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI

@main
struct MixerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
