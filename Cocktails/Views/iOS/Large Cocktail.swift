//
//  LargeCocktailView.swift
//  Cocktails
//
//  Created by Josh Smith on 3/10/22.
//

import SwiftUI
import SwiftData

struct LargeCocktailView: View {
    
    init(for cocktail: Cocktail, viewing: Binding<Cocktail?>) {
        self.cocktail = cocktail
        self._viewing = viewing
    }
    
    var cocktail: Cocktail
    @Binding var viewing: Cocktail?
    
    
    // Calculated Variables
    
    @State private var isLiked = false
    @State private var isDisliked = false
    
    @State private var upColor: Color?
    @State private var downColor: Color?
    
    @State private var settingNumberOfDrinks = false
    @State private var numberOfDrinks = 1
    @State private var bartenderView = false
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                
                #if !os(visionOS)
                cocktail.heroImage(width: geo.size.width, height: geo.size.height)
                #endif
                
                HStack(alignment: .top, spacing: 0) {
                    
                    Group {
                        switch UIDevice.current.userInterfaceIdiom {
                        case .phone:
                            smallScreenView(size: geo)
                        default:
                            largeScreenView(size: geo)
                        }
                    }
                    .frame(width: geo.size.width / 3, alignment: .top)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 25) {
                            
                            if UIDevice.current.userInterfaceIdiom != .phone {
                                details
                                
                                Divider()
                            }
                            
                            ingredients
                            
                            Divider()
                            
                            instructions
                            
                            Divider()
                            
                            supplies
                            
                        }
                        .padding()
                        .padding(.bottom)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
            }
            .navigationTitle(cocktail.name)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Mix", systemImage: "shuffle") {
                        bartenderView.toggle()
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $bartenderView) {
            BartenderView(cocktail)
        }
    }
    
    
    // Main Functions
    
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
    
    
    // Supporting Info
    
    var firstColumnPadding: CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .tv:
            return 75
        default:
            return 25
        }
    }
    
    var sectionTitle: Font {
        return .title.weight(.semibold)
    }
    
    var textSize: Font {
        return .body
    }
    
    var buttonFrame: CGFloat {
        size(phone: 1, tv: 30, mac: 10)
    }
    
    func font(_ font: Font, phone: CGFloat? = nil, pad: CGFloat? = nil, tv: CGFloat? = nil, mac: CGFloat? = nil, vision: CGFloat? = nil) -> Font {
        
        var result: Font = .body
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if let phone {
                result = .system(size: phone)
            }
        case .pad:
            if let pad {
                result = .system(size: pad)
            }
        case .tv:
            if let tv {
                result = .system(size: tv)
            }
        case .mac:
            if let mac {
                result = .system(size: mac)
            }
        case .vision:
            if let vision {
                result = .system(size: vision)
            }
        default:
            result = font
        }
        
        return result
    }
    
    func size(phone: CGFloat? = nil, pad: CGFloat? = nil, tv: CGFloat? = nil, mac: CGFloat? = nil, vision: CGFloat? = nil) -> CGFloat {
        
        var result: CGFloat? = 0
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            result = phone
        case .pad:
            result = pad
        case .tv:
            result = tv
        case .mac:
            result = mac
        case .vision:
            result = vision
        default:
            result = 0
        }
        
        return result ?? 0
        
    }
    
    
    // Additional View
    
    func largeScreenView(size geo: GeometryProxy) -> some View {
        return ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Image("\(cocktail.name)-Square")
                    .resizable()
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.bottom)
                
                Text("History")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text(cocktail.history)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.leading)
                
            }
            .multilineTextAlignment(.leading)
            .padding()
            .padding(.bottom)
            .frame(width: geo.size.width / 3)
        }
    }
    
    func smallScreenView(size geo: GeometryProxy) -> some View {
        
        VStack {
            Spacer()
            
            Image("\(cocktail.name)-Square")
                .resizable()
                .scaledToFill()
                .clipShape(.rect(cornerRadius: 15))
                .padding(.bottom)
            
            HStack(spacing: 15) {
                
                Text(cocktail.name)
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                                
            }
            
            Text(cocktail.flavorProfile)
                .font(.body)
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
            
            Text(cocktail.name)
                .font(.largeTitle.weight(.bold))
                .foregroundColor(.white)
            
            Text(cocktail.flavorProfile)
                .font(.title)
                .foregroundColor(.white)
                .opacity(0.7)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom)
            
            Text(title)
                .font(sectionTitle)
                .foregroundColor(.white)
            
            Text(text)
                .font(textSize)
                .foregroundColor(.white)
                .opacity(0.7)
                .fixedSize(horizontal: false, vertical: true)
            
        }
        
    }
    
    var ingredients: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 15) {

                Text("Ingredients")
                    .font(sectionTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Decrease", systemImage: "minus", action: decrease)
                    .labelStyle(.iconOnly)
                    .buttonStyle(.bordered)
                    .disabled(numberOfDrinks == 1)
                
                Button(numberOfDrinks.formatted()) {
                    settingNumberOfDrinks = true
                }
                .buttonStyle(.bordered)
                .alert("Number of Drinks", isPresented: $settingNumberOfDrinks) {
                    TextField("Total", value: $numberOfDrinks, format: .number.precision(.fractionLength(0)))
                }
                
                Button("Increase", systemImage: "plus", action: increase)
                    .labelStyle(.iconOnly)
                    .buttonStyle(.bordered)
                
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
                        .font(textSize)
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
                .font(sectionTitle)
                .padding(.bottom, size(tv: 35, mac: 0))

            VStack(spacing: 25) {
                ForEach(cocktail.instructions, id: \.self) { instruction in
                    
                    if let index = cocktail.instructions.firstIndex(of: instruction) {
                        HStack(alignment: .top, spacing: 10) {
                            Text("\(index + 1).")
                                .frame(width: 20, alignment: .leading)
                            Text(instruction)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                        }
                        .font(textSize)
                    }
                    
                }
            }
            
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
        
    }
    
    var supplies: some View {
        
        return VStack(alignment: .leading, spacing: 20) {
            
            Text("Supplies")
                .font(sectionTitle)

            VStack(spacing: 25) {
                ForEach(cocktail.supplies, id: \.self) { item in
                    
                    Button(action: {}) {
                        HStack {
                            Text(item.name)
                                .font(textSize)
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
    
    
    // Environments
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isFocused) private var focused: Bool
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cocktail.self, configurations: config)
    
    return LargeCocktailView(
        for: Cocktail.example(of: "Martini"),
        viewing: .constant(nil)
    )
    .environmentObject(Bar.shared)
    .modelContainer(container)
}
