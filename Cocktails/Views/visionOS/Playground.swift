//
//  Playground.swift
//  Cocktails
//
//  Created by Josh Smith on 1/10/24.
//

import SwiftUI
import SwiftData

struct Playground: View {
    
    let cocktail = cocktails[0]
    
    var body: some View {
        NavigationLink {
            
        } label: {
            Image(.martiniHero)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 250, alignment: .center)
                .clipShape(.rect(cornerRadius: 12))
        }
        .cocktailButton(radius: 12)
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)

    return Playground()
        .environmentObject(Bar.shared)
        .modelContainer(container)
}
