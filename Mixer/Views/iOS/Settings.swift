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
        NavigationView {
            List {
                Button("Reset Ratings", role: .destructive, action: bar.deleteRatings)
                    .disabled(bar.liked.isEmpty && bar.disliked.isEmpty)
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
    }
}
