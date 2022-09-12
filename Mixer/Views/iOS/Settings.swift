//
//  SettingsView.swift
//  Cocktails (iOS)
//
//  Created by Josh Smith on 2/26/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var bar: Bar
    @FocusState private var focused: Bool
    
    @State private var min: Int?
    @State private var max: Int?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button("Request Permission") {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    Button("Schedule Notification") {
                        let content = UNMutableNotificationContent()
                        content.title = "Feed the cat"
                        content.subtitle = "It looks hungry"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
                }
                Section {
                    Button("Reset Spotlight", action: {bar.spotlightIndexed = false})
                        .disabled(bar.spotlightIndexed == false)
                    Button("Reset Ratings", role: .destructive, action: bar.deleteRatings)
                        .disabled(bar.liked.isEmpty && bar.disliked.isEmpty)
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func show(_ cocktail: Cocktail) -> Bool {
        if let min = min {
            if min > cocktail.number {
                return false
            }
        }
        if let max = max {
            if max < cocktail.number {
                return false
            }
        }
        return true
    }
}

extension Double {
    
    var rounded: String {
        return String((self * 10).rounded() / 10)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Bar.preview)
    }
}
