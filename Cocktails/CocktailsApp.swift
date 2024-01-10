//
//  CocktailsApp.swift
//  Cocktails
//
//  Created by Josh Smith on 8/24/22.
//

import SwiftUI
import CoreSpotlight
#if canImport(WidgetKit)
import WidgetKit
#endif

@main
struct CocktailsApp: App {
    
    @StateObject var bar: Bar

    init() {
        let bar = Bar.shared
        _bar = StateObject(wrappedValue: bar)
    }
    
    @State private var sheet: SheetItem?

    var body: some Scene {
        WindowGroup {
            Group {
                #if os(visionOS)
                VisionHome()
                #else
                TabView {
                    CocktailList()
                        .sheet(item: $sheet) { sheet in
                            switch sheet {
                            case .shopping:
                                ShoppingView()
                            case .filter:
                                FilterView()
                            case .ingredients:
                                CocktailsByIngredient()
                            case .guests:
                                GuestsView()
                            case .settings:
                                SettingsView()
                            }
                        }
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    GuestsView()
                        .tabItem {
                            Label("Guests", systemImage: "person.3")
                        }
                }
                #endif
            }
            .modelContainer(for: [Cocktail.self, Guest.self])
            .environmentObject(bar)
            .onAppear(perform: bar.loadSearch)
            .onOpenURL(perform: openURL)
            .onContinueUserActivity(CSSearchableItemActionType, perform: loadSpotlightItem)
        }
    }
    
    func openURL(_ url: URL) {
        if url.isDeepLink {
            if let cocktail = url.cocktail {
                print("COMMENT (Open URL): Opening \(cocktail.name).")
                bar.selectedCocktail = [cocktail]
            } else if let host = url.host {
                print("COMMENT (Open URL): Opening \(host).")
                sheet = SheetItem(host)
            }
        } else {
            print("COMMENT (Open URL): URL \(url) is not a deep link.")
        }
    }
    
    func loadSpotlightItem(userActivity: NSUserActivity) {

        if let path = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            let url = URL(string: "cocktails://\(path.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")
            if let url {
                openURL(url)
            }
        }
    }
    
    enum SheetItem: String, Identifiable {
        case shopping, filter, ingredients, guests, settings
        var id: Self { return self }
        init(_ path: String) {
            self = SheetItem(rawValue: path) ?? .shopping
        }
    }
}
