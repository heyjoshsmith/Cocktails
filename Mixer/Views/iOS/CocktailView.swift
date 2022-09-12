//
//  CocktailView.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import SwiftUI

struct CocktailView: View {
    
    @EnvironmentObject private var bar: Bar
    @Environment(\.dismiss) private var dismiss
    
    var cocktail: Cocktail
    
    @State private var showingIngredients = true
    @State private var showingInstructions = true
    @State private var showingSupplies = true
    
    @State private var numberOfDrinks = 1
    @State private var stepper = true
    @FocusState private var focused: Bool
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    @State private var currentRating: RatingType = .none
    
    @State private var orientation = UIDeviceOrientation.unknown
    
    var item: Image {
        Image(uiImage: ShareableView(for: cocktail).snapshot())
    }
    
    var body: some View {
        
        Group {
            if bar.device == .iPad || (bar.device == .iPhone && (orientation == .landscapeLeft || orientation == .landscapeRight)) {
                LargeCocktailView(for: cocktail, viewing: .constant(cocktail))
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        ZStack(alignment: .bottomLeading) {
                            
                            cocktail.heroImage(height: 225)
                            
                            HStack {
                                Text(cocktail.flavorProfile)
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding([.leading, .vertical])
                            .backgroundGradient()
                        }
                        
                        VStack(alignment: .leading, spacing: 25) {
                            
                            if let tip = cocktail.tip {
                                tips(tip: tip)
                            }
                            
                            ingredients
                            
                            instructions
                            
                            supplies
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.bottom)
                    .tint(cocktail.category.color)
                    .accentColor(cocktail.category.color)
                    .navigationTitle(cocktail.name)

                }
                .background(Color.background)
                .onAppear(perform: load)
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction) {
                        
                        Menu {
                            ForEach(RatingType.allCases, id: \.self) { rating in
                                Button {
                                    bar.rate(cocktail, rating: rating)
                                    currentRating = rating
                                } label: {
                                    Label(rating.action, systemImage: rating.icon)
                                }
                            }
                        } label: {
                            if self.currentRating == .none {
                                Text("Rate")
                                    .fontWeight(.regular)
                            } else {
                                Label(self.currentRating.action, systemImage: self.currentRating.icon)
                                    .symbolVariant(.circle.fill)
                                    .foregroundStyle(.white, self.currentRating.color)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Button(action: share) {
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                    }
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        
    }
    
    func share() {
        
        withAnimation {
            
            let image = ShareableView(for: cocktail).offset(y: -20).snapshot()
                        
            let av = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            
            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
            
        }
        
    }

    
    func load() {
        
        if bar.likes.contains(cocktail.number) {
            currentRating = .liked
        } else if bar.dislikes.contains(cocktail.number) {
            currentRating = .disliked
        } else {
            currentRating = .none
        }
        
        let userActivity = NSUserActivity(activityType: "com.heyjoshsmith.Cocktails")
        userActivity.title = cocktail.name
        userActivity.persistentIdentifier = cocktail.name
        userActivity.isEligibleForSearch = true
        userActivity.contentAttributeSet = bar.attributeSet(cocktail)
        userActivity.becomeCurrent() // making this the current user activity will index it

    }
    
    var titleView: some View {
        return VStack(alignment: .leading, spacing: 5) {
            Text(cocktail.name)
                .font(.largeTitle.weight(.bold))
            
            Text(cocktail.flavorProfile)
                .foregroundColor(.secondary)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom)
    }
    
    func tips(tip: String) -> some View {
        
        var title: String {
            let strings = tip.components(separatedBy: ": ")
            return strings.first ?? "Info"
        }
        
        var text: String {
            let strings = tip.components(separatedBy: ": ")
            return strings.last ?? "Info"
        }
        
        return VStack(alignment: .leading) {
            Text(title)
                .textCase(.uppercase)
                .font(.headline.weight(.bold))
            HStack {
                Text(text)
                Spacer()
            }
        }
        .foregroundStyle(.white)
        .padding([.leading, .vertical])
        .multilineTextAlignment(.leading)
        .background(LinearGradient(colors: [cocktail.category.color, cocktail.category.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        
    }
    
    var ingredients: some View {
        
        return VStack(alignment: .leading) {
            
            Button {
                withAnimation {
                    showingIngredients.toggle()
                }
            } label: {
                HStack {
                    Text("Ingredients for \(numberOfDrinks)")
                        .font(.title.weight(.bold))
                    Spacer()
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.system(size: 22))
                        .rotationEffect(Angle(degrees: showingIngredients ? 0 : -90))
                }
            }
            .padding(.bottom, 5)
            
            if showingIngredients {
                VStack(alignment: .leading) {
                    ForEach(cocktail.ingredients) { ingredient in
                        
                        HStack {
                            Text(ingredient.name)
                            Spacer()
                            Text(ingredient.measurement(for: numberOfDrinks))
                                .foregroundColor(.secondary)
                        }
                        
                        if ingredient != cocktail.ingredients.last {
                            Divider().padding(.trailing, -15)
                        }
                        
                    }
                    
                    Divider().padding(.trailing, -15)
                    
                    HStack {
                        
                        Text("Number of Drinks")
                            .onTapGesture {
                                withAnimation {
                                    stepper.toggle()
                                }
                            }
                        
                        Spacer()
                        
                        if stepper {
                            Stepper("Number of Drinks", value: $numberOfDrinks, in: 1...50)
                                .labelsHidden()
                                .transition(.move(edge: .trailing))
                        } else {
                            TextField("1", value: $numberOfDrinks, format: .number)
                                .multilineTextAlignment(.trailing)
                                .padding(5)
                                #if os(iOS)
                                .keyboardType(.numberPad)
                                #endif
                                .transition(.move(edge: .trailing))
                                .focused($focused)
                                .onTapGesture {
                                    if focused {
                                        focused = false
                                    }
                                }
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(cocktail.category.gradient)
                    .padding(.top, -8)
                    .padding(.horizontal, -16)
                    .padding(.bottom, -16)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                focused = false
                            }
                        }
                    }
                    
                }
                .padding()
                .background(Color.background2)
                .cornerRadius(10)
                .transition(.move(edge: .bottom))
            }
            
        }
        .cornerRadius(10)
        
    }
    
    var instructions: some View {
        
        return VStack(alignment: .leading) {
            
            Button {
                withAnimation {
                    showingInstructions.toggle()
                }
            } label: {
                HStack {
                    Text("Instructions")
                        .font(.title.weight(.bold))
                    Spacer()
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.system(size: 22))
                        .rotationEffect(Angle(degrees: showingInstructions ? 0 : -90))
                }
            }
            .padding(.bottom, 5)
            
            if showingInstructions {
                VStack(alignment: .leading) {
                    ForEach(cocktail.instructions, id: \.self) { instruction in
                        
                        if let index = cocktail.instructions.firstIndex(of: instruction) {
                            HStack(alignment: .top) {
                                Image(systemName: "\(index + 1).circle")
                                    .foregroundColor(cocktail.category.color)
                                    .frame(width: 20, height: 20, alignment: .center)
                                Text(instruction)
                            }
                        }
                        
                        if instruction != cocktail.instructions.last {
                            Divider()
                                .padding(.leading, 25)
                                .padding(.trailing, -15)
                        }
                        
                    }
                }
                .padding()
                .background(Color.background2)
                .cornerRadius(10)
                .transition(.move(edge: .bottom))
            }
        }
        .cornerRadius(10)
        
    }
    
    var supplies: some View {
        
        return VStack(alignment: .leading) {
            
            Button {
                withAnimation {
                    showingSupplies.toggle()
                }
            } label: {
                HStack {
                    Text("Supplies")
                        .font(.title.weight(.bold))
                    Spacer()
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.system(size: 22))
                        .rotationEffect(Angle(degrees: showingSupplies ? 0 : -90))
                }
            }
            .padding(.bottom, 5)
            
            if showingSupplies {
                VStack(alignment: .leading) {
                    ForEach(cocktail.supplies, id: \.self) { item in
                        
                        Text(item.name)
                        
                        if item != cocktail.supplies.last {
                            Divider()
                                .padding(.trailing, -15)
                        }
                        
                    }
                }
                .padding()
                .background(Color.background2)
                .cornerRadius(10)
                .transition(.move(edge: .bottom))
            }
        }
        .cornerRadius(10)
        
    }
    
}

struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CocktailView(for: cocktails[69])
        }
        .environmentObject(Bar.preview)
    }
}
