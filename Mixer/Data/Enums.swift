//
//  DataStructures.swift
//  Cocktails
//
//  Created by Josh Smith on 2/21/22.
//

import SwiftUI

enum CocktailCategory: Codable, Hashable, CaseIterable, Identifiable {
    case brandy, dessert, gin, rum, scotch, sparklingWine, tequila, vodka, whiskey, other
    
    var name: String {
        switch self {
        case .brandy:
            return "Brandy"
        case .dessert:
            return "Dessert"
        case .gin:
            return "Gin"
        case .rum:
            return "Rum"
        case .scotch:
            return "Scotch"
        case .sparklingWine:
            return "Sparkling Wine"
        case .tequila:
            return "Tequila"
        case .vodka:
            return "Vodka"
        case .whiskey:
            return "Whiskey"
        case .other:
            return "Other"
        }
    }
    
    var color: Color {
        switch self {
        case .brandy:
            return Color(hex: "#907bef")
        case .dessert:
            return Color(hex: "#dfbd7e")
        case .gin:
            return Color(hex: "#4a9fb4")
        case .rum:
            return Color(hex: "#b0423b")
        case .scotch:
            return Color(hex: "#6d4837")
        case .sparklingWine:
            return Color(hex: "#8a764c")
        case .tequila:
            return Color(hex: "#76a26a")
        case .vodka:
            return Color(hex: "#e56593")
        case .whiskey:
            return Color(hex: "#883d38")
        case .other:
            return Color(hex: "#c17feb")
        }
    }
    
    var gradient: LinearGradient {
        return LinearGradient(colors: [color, color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var recipes: [Cocktail] {
        return cocktails.filter { cocktail in
            cocktail.category == self
        }
    }
    
    func searchRecipes(_ search: String) -> [Cocktail] {
        if search.isEmpty {
            return recipes
        } else {
            return recipes.filter { cocktail in
                cocktail.name.lowercased().contains(search.lowercased())
            }
        }
    }
    
    
    var id: Self {
        return self
    }
}

enum IngredientType: String, Codable, Hashable, CaseIterable, Identifiable {
    case brandy, cognac, cremeDeCacao, heavyCream, groundNutmeg, demeraraSugar, egg, orangeLiqueur, lemonJuice, sugarRim, lemonPeel, ryeWhiskey, sweetVermouth, benedictine, angosturaBitters, peychaudsBitters, lemonTwistOrCherry, orangeSlices, maraschinoCherries, sugarCube, sevenUp, cherryAndOrangeSlice, amaretto, baileys, kahlua, caramelAndShavedChocolate, vodka, chocolateSyrupAndShavedChocolate, cremeDeMentheGreen, groundNutmegOrChocolate, cognacOrBrandy, eggYolk, mascarponeCheese, chocolatePowder, gin, maraschino, cremeDeViolette, lemonPeelOrDarkCharry, honeySyrup, lemonTwist, simpleSyrup, cremeDeMure, lemonWedgeAndBlackberry, raspberrySyrup, eggWhite, raspberriesOrLemonZest, cocchiAmericano, absinthe, campari, redGrapes, orangeWedgeAndGrape, limeJuice, limeWheel, stGermain, sugarRimAndGrapefruitTwist, greenChartreuse, maraschinoLiqueur, maraschinoCherry, dryGin, orangeBitters, dryVermouth, oliveJuice, cocktailOlives, orangePeel, orangeFlowerWater, sodaWater, lemonPeelOrCherry, lillet, bourbon, orangePeelOrWedge, rum, tequila, blueCuracao, lemonLimeSoda, lemonWedgeOrCherry, jagerMeister, lightRum, mexicanCoke, pimms1, lemonSoda, cucumber, lemon, strawberries, appleSlices, mint, pisco, redWine, oranges, dicedGreenApple, dicedLemon, cinnamonStick, agedRum, pineappleJuice, orgeatAlmondSyrup, pineappleFrond, cachaca, lime, fineSugar, whiteRum, limeWedge, darkRum, gingerBeer, blancVermouth, dryCurcacao, grenadine, grapefruitJucie, saltedButter, brownSugar, groundNutmegCinnamonAndClove, vanillaIceCream, spicedRum, hotButteredBatter, hotWater, darkSpicedRum, passionfruitSyrup, orgeatSyrup, halfLimeAndMint, limeWheelAndMintSprig, pussersRum, cremeOfCoconut, orangeJuice, pineappleFrondsAndGroundNutmeg, pineappleWedgeAndCherry, rum151, coffee, heavyCreamAndNutmeg, blendedScotch, cherryHeering, orangePeelOrCherry, gingerSyrup, islayScotchFloat, candiedGinger, cherry, drambuie, aperol, prosecco, orangeWedgeOrTwist, champagne, peachPuree, sliceOfPeach, blancoTequila, cranberryJuice, grapefruitPeel, tripleSec, agave, reposadoTequila, mezcal, agaveNectar, greenAppleSchnapps, appleSliceOrCherry, tomatoJuice, worcestershire, horseradish, hotSauce, saltAndPepper, celery, espresso, coffeBeans, raspberryLiqueur, raspberriesOrPineappleWedgeOrLemontTwist, grapefruitWedge, fuzzyNavelPeachSchnapps, hairyNavelPeachSchnapps, hairyNavelVodka, galliano,orangeWedgeOrCherry, peachschnapps, orangeWheelAndCherry, whiskey, blackWalnutBitters, realMapleSyrup, demeraraSyrup, amaroNonino, fernetBranca, crownRoyal, sourAppleSchnapps
    
    var name: String {
        switch self {
        case .cognac:
            return "Cognac"
        case .cremeDeCacao:
            return "Creme De Cacao"
        case .heavyCream:
            return "Heavy Cream"
        case .groundNutmeg:
            return "Ground Nutmeg"
        case .brandy:
            return "Brandy"
        case .demeraraSugar:
            return "Demerara Sugar"
        case .egg:
            return "Egg"
        case .orangeLiqueur:
            return "Orange Liqueur"
        case .lemonJuice:
            return "Lemon Juice"
        case .sugarRim:
            return "Sugar Rim"
        case .lemonPeel:
            return "Lemon Peel"
        case .ryeWhiskey:
            return "Rye Whiskey"
        case .sweetVermouth:
            return "Sweet Vermouth"
        case .benedictine:
            return "Benedictine"
        case .angosturaBitters:
            return "Angostura Bitters"
        case .peychaudsBitters:
            return "Peychaud's Bitters"
        case .lemonTwistOrCherry:
            return "Lemon Twist or Cherry"
        case .orangeSlices:
            return "Orange Slices"
        case .maraschinoCherries:
            return "Maraschino Cherries"
        case .sugarCube:
            return "Sugar Cubes"
        case .sevenUp:
            return "7-Up"
        case .cherryAndOrangeSlice:
            return "Cherry & Orange Slices"
        case .amaretto:
            return "Amaretto"
        case .baileys:
            return "Baileys"
        case .kahlua:
            return "Kahlua"
        case .caramelAndShavedChocolate:
            return "Caramel & Shaved Chocolate"
        case .vodka:
            return "Vodka"
        case .chocolateSyrupAndShavedChocolate:
            return "Chocolate Syrup & Shaved Chocolate"
        case .cremeDeMentheGreen:
            return "Créme de Menthe (Green)"
        case .groundNutmegOrChocolate:
            return "Ground Nutmeg or Chocolate"
        case .cognacOrBrandy:
            return "Cognac or Brandy"
        case .eggYolk:
            return "Egg Yolk"
        case .mascarponeCheese:
            return "Mascarponse Cheese"
        case .chocolatePowder:
            return "Choclate Powder"
        case .gin:
            return "Gin"
        case .maraschino:
            return "Maraschino"
        case .cremeDeViolette:
            return "Créme de Violette"
        case .lemonPeelOrDarkCharry:
            return "Lemon Peel or Dark Cherry"
        case .honeySyrup:
            return "Honey Syrup"
        case .lemonTwist:
            return "Lemon Twist"
        case .simpleSyrup:
            return "Simple Syrup"
        case .cremeDeMure:
            return "Créme de Mûre"
        case .lemonWedgeAndBlackberry:
            return "Lemon Wedge & Blackberry"
        case .raspberrySyrup:
            return "Raspberry Syrup"
        case .eggWhite:
            return "Egg White"
        case .raspberriesOrLemonZest:
            return "Raspberries or Lemon Zest"
        case .cocchiAmericano:
            return "Cocchi Americano"
        case .absinthe:
            return "Absinthe"
        case .campari:
            return "Campari"
        case .redGrapes:
            return "Red Grapes"
        case .orangeWedgeAndGrape:
            return "Orange Wedge and Grape"
        case .limeJuice:
            return "Lime Juice"
        case .limeWheel:
            return "Lime Wheel"
        case .stGermain:
            return "St. Germain"
        case .sugarRimAndGrapefruitTwist:
            return "Sugar Rim and Grapefruit Twist"
        case .greenChartreuse:
            return "Green Chartreuse"
        case .maraschinoLiqueur:
            return "Maraschino Liqueur"
        case .maraschinoCherry:
            return "Maraschino Cherry"
        case .dryGin:
            return "Dry Gin"
        case .orangeBitters:
            return "Orange Bitters"
        case .dryVermouth:
                return "Dry Vermouth"
        case .oliveJuice:
            return "Olive Juice"
        case .cocktailOlives:
            return "Cocktail Olives"
        case .orangePeel:
            return "Orange Peel"
        case .orangeFlowerWater:
            return "Orange Flower Water"
        case .sodaWater:
            return "Soda Water"
        case .lemonPeelOrCherry:
            return "Lemon Peel or Cherry"
        case .lillet:
            return "Lillet"
        case .bourbon:
            return "Bourbon"
        case .orangePeelOrWedge:
            return "Orange Peel or Wedge"
        case .rum:
            return "Rum"
        case .tequila:
            return "Tequila"
        case .blueCuracao:
            return "Blue Curaçao"
        case .lemonLimeSoda:
            return "Lemon/Lime Soda"
        case .lemonWedgeOrCherry:
            return "Lemon Wedge or Cherry"
        case .jagerMeister:
            return "Jägermeister"
        case .lightRum:
            return "Light Rum"
        case .mexicanCoke:
            return "Mexican Coke"
        case .pimms1:
            return "Pimm's #1"
        case .lemonSoda:
            return "Lemon Soda"
        case .cucumber:
            return "Cucumber"
        case .lemon:
            return "Lemon"
        case .strawberries:
            return "Strawberries"
        case .appleSlices:
            return "Apple Slices"
        case .mint:
            return "Mint"
        case .pisco:
            return "Pisco"
        case .redWine:
            return "Red Wine"
        case .oranges:
            return "Oranges"
        case .dicedGreenApple:
            return "Diced Green Apples"
        case .dicedLemon:
            return "Diced Lemon"
        case .cinnamonStick:
            return "Cinnamon Sticks"
        case .agedRum:
            return "Aged Rum"
        case .pineappleJuice:
            return "Pineapple Juice"
        case .orgeatAlmondSyrup:
            return "Orgeat Almond Syrup"
        case .pineappleFrond:
            return "Pineapple Frond"
        case .cachaca:
            return "Cachaça"
        case .lime:
            return "Lime"
        case .fineSugar:
            return "Fine Sugar"
        case .whiteRum:
            return "White Rum"
        case .limeWedge:
            return "Lime Wedge"
        case .gingerBeer:
            return "Ginger Beer"
        case .darkRum:
            return "Dark Rum"
        case .blancVermouth:
            return "Blanch Vermouth"
        case .dryCurcacao:
            return "Dry Curacao"
        case .grenadine:
            return "Grenadine"
        case .grapefruitJucie:
            return "Grapefruit Juice"
        case .saltedButter:
            return "Batter: Salted Butter"
        case .brownSugar:
            return "Batter: Brown Sugar"
        case .groundNutmegCinnamonAndClove:
            return "Batter: Ground Nutmeg, Cinnamon, & Clove"
        case .vanillaIceCream:
            return "Batter: Vanilla Ice Cream"
        case .spicedRum:
            return "Spiced Rum"
        case .hotButteredBatter:
            return "Hot Buttered Batter"
        case .hotWater:
            return "Hot Water"
        case .darkSpicedRum:
            return "Dark Spiced Rum"
        case .passionfruitSyrup:
            return "Passionfruit Syrup"
        case .orgeatSyrup:
            return "Orgeat Syrup"
        case .halfLimeAndMint:
            return "Half Lime & Mint"
        case .limeWheelAndMintSprig:
            return "Lime Wheel & Mint Sprig"
        case .pussersRum:
                return "Pusser's Rum"
        case .cremeOfCoconut:
            return "Créme of Coconut"
        case .orangeJuice:
            return "Orange Juice"
        case .pineappleFrondsAndGroundNutmeg:
            return "Pineapple Fronds & Ground Nutmeg"
        case .pineappleWedgeAndCherry:
            return "Pineapple Wedge & Cherry"
        case .rum151:
            return "151 Proof Rum"
        case .coffee:
            return "Coffee"
        case .heavyCreamAndNutmeg:
            return "Heavy Cream & Nutmeg"
        case .blendedScotch:
            return "Blended Scotch"
        case .cherryHeering:
            return "Cherry Heering"
        case .orangePeelOrCherry:
            return "Orange Peel or Cherry"
        case .gingerSyrup:
            return "Ginger Syrup"
        case .islayScotchFloat:
            return "Islay Scotch Float"
        case .candiedGinger:
            return "Candied Ginger"
        case .cherry:
            return "Cherry"
        case .drambuie:
            return "Drambuie"
        case .aperol:
            return "Aperol"
        case .prosecco:
            return "Prosecco"
        case .orangeWedgeOrTwist:
            return "Orange Wedge or Twist"
        case .champagne:
            return "Champagne"
        case .peachPuree:
            return "Peach Puree"
        case .sliceOfPeach:
            return "Slice of Peach"
        case .blancoTequila:
            return "Blanco Tequila"
        case .cranberryJuice:
            return "Cranberry Juice"
        case .grapefruitPeel:
            return "Grapefruit Peel"
        case .tripleSec:
            return "Triple Sec"
        case .agave:
            return "Agave"
        case .agaveNectar:
            return "Agave Nectar"
        case .reposadoTequila:
            return "Reposado Tequila"
        case .mezcal:
            return "Mezcal"
        case .greenAppleSchnapps:
            return "Green Apple Schnapps"
        case .appleSliceOrCherry:
            return "Apple Slice or Cherry"
        case .tomatoJuice:
            return "Tomato Juice"
        case .worcestershire:
            return "Worcestershire"
        case .horseradish:
            return "Horse Radish"
        case .hotSauce:
            return "Hot Sauce"
        case .saltAndPepper:
            return "Salt & Pepper"
        case .celery:
            return "Celery"
        case .espresso:
            return "Espresso"
        case .coffeBeans:
            return "Coffee Beans"
        case .raspberryLiqueur:
            return "Raspberry Liqueur"
        case .raspberriesOrPineappleWedgeOrLemontTwist:
            return "Raspberries, Pineapple Wedges, or Lemon Twist"
        case .grapefruitWedge:
            return "Grapefruit Wedge"
        case .fuzzyNavelPeachSchnapps:
            return "Fuzzy Navel: Peach Schnapps"
        case .hairyNavelVodka:
            return "Hairy Navel: Vodka"
        case .hairyNavelPeachSchnapps:
            return "Hairy Navel: Peach Schnapps"
        case .galliano:
            return "Galliano"
        case .orangeWedgeOrCherry:
            return "Orange Wedge or Cherry"
        case .peachschnapps:
            return "Peach Schnapps"
        case .orangeWheelAndCherry:
            return "Orange Wheel & Cherry"
        case .whiskey:
            return "Whiskey"
        case .blackWalnutBitters:
            return "Black Walnut Bitters"
        case .realMapleSyrup:
            return "Real Maple Syrup"
        case .demeraraSyrup:
            return "Demerara Syrup"
        case .amaroNonino:
            return "Amaro Nonino"
        case .fernetBranca:
            return "Fernet-Branca"
        case .crownRoyal:
            return "Crown Royal"
        case .sourAppleSchnapps:
            return "Sour Apple Schnapps"
        }
    }
    
    var units: Unit {
        switch self {
        case .cognac:
            return UnitVolume.fluidOunces
        case .cremeDeCacao:
            return UnitVolume.fluidOunces
        case .heavyCream:
            return UnitVolume.fluidOunces
        case .groundNutmeg:
            return UnitGarnish.garnish
        case .brandy:
            return UnitVolume.fluidOunces
        case .demeraraSugar:
            return UnitVolume.fluidOunces
        case .egg:
            return UnitItems.items
        case .orangeLiqueur:
            return UnitVolume.fluidOunces
        case .lemonJuice:
            return UnitVolume.fluidOunces
        case .sugarRim:
            return UnitGarnish.garnish
        case .lemonPeel:
            return UnitGarnish.garnish
        case .ryeWhiskey:
            return UnitVolume.fluidOunces
        case .sweetVermouth:
            return UnitVolume.fluidOunces
        case .benedictine:
            return UnitVolume.fluidOunces
        case .angosturaBitters:
            return UnitDash.dashes
        case .peychaudsBitters:
            return UnitDash.dashes
        case .lemonTwistOrCherry:
            return UnitGarnish.garnish
        case .orangeSlices:
            return UnitItems.items
        case .maraschinoCherries:
            return UnitItems.items
        case .sugarCube:
            return UnitItems.items
        case .sevenUp:
            return UnitVolume.fluidOunces
        case .cherryAndOrangeSlice:
            return UnitGarnish.garnish
        case .amaretto:
            return UnitVolume.fluidOunces
        case .baileys:
            return UnitVolume.fluidOunces
        case .kahlua:
            return UnitVolume.fluidOunces
        case .caramelAndShavedChocolate:
            return UnitGarnish.garnish
        case .vodka:
            return UnitVolume.fluidOunces
        case .chocolateSyrupAndShavedChocolate:
            return UnitGarnish.garnish
        case .cremeDeMentheGreen:
            return UnitVolume.fluidOunces
        case .groundNutmegOrChocolate:
            return UnitGarnish.garnish
        case .cognacOrBrandy:
            return UnitVolume.fluidOunces
        case .eggYolk:
            return UnitItems.items
        case .mascarponeCheese:
            return UnitVolume.tablespoons
        case .chocolatePowder:
            return UnitGarnish.garnish
        case .gin:
            return UnitVolume.fluidOunces
        case .maraschino:
            return UnitVolume.fluidOunces
        case .cremeDeViolette:
            return UnitVolume.fluidOunces
        case .lemonPeelOrDarkCharry:
            return UnitGarnish.garnish
        case .honeySyrup:
            return UnitVolume.fluidOunces
        case .lemonTwist:
            return UnitGarnish.garnish
        case .simpleSyrup:
            return UnitVolume.fluidOunces
        case .cremeDeMure:
            return UnitVolume.fluidOunces
        case .lemonWedgeAndBlackberry:
            return UnitGarnish.garnish
        case .raspberrySyrup:
            return UnitVolume.fluidOunces
        case .eggWhite:
            return UnitItems.items
        case .raspberriesOrLemonZest:
            return UnitGarnish.garnish
        case .cocchiAmericano:
            return UnitVolume.fluidOunces
        case .absinthe:
            return UnitNone.none
        case .campari:
            return UnitVolume.fluidOunces
        case .redGrapes:
            return UnitItems.items
        case .orangeWedgeAndGrape:
            return UnitGarnish.garnish
        case .limeJuice:
            return UnitVolume.fluidOunces
        case .limeWheel:
            return UnitGarnish.garnish
        case .stGermain:
            return UnitVolume.fluidOunces
        case .sugarRimAndGrapefruitTwist:
            return UnitGarnish.garnish
        case .greenChartreuse:
            return UnitVolume.fluidOunces
        case .maraschinoLiqueur:
            return UnitVolume.fluidOunces
        case .maraschinoCherry:
            return UnitGarnish.garnish
        case .dryGin:
            return UnitVolume.fluidOunces
        case .orangeBitters:
            return UnitItems.items
        case .dryVermouth:
            return UnitVolume.fluidOunces
        case .oliveJuice:
            return UnitVolume.fluidOunces
        case .cocktailOlives:
            return UnitGarnish.garnish
        case .orangePeel:
            return UnitGarnish.garnish
        case .orangeFlowerWater:
            return UnitDrops.drops
        case .sodaWater:
            return UnitVolume.fluidOunces
        case .lemonPeelOrCherry:
            return UnitGarnish.garnish
        case .lillet:
            return UnitVolume.fluidOunces
        case .bourbon:
            return UnitVolume.fluidOunces
        case .orangePeelOrWedge:
            return UnitGarnish.garnish
        case .rum:
            return UnitVolume.fluidOunces
        case .tequila:
            return UnitVolume.fluidOunces
        case .blueCuracao:
            return UnitVolume.fluidOunces
        case .lemonLimeSoda:
            return UnitVolume.fluidOunces
        case .lemonWedgeOrCherry:
            return UnitGarnish.garnish
        case .jagerMeister:
            return UnitVolume.fluidOunces
        case .lightRum:
            return UnitVolume.fluidOunces
        case .mexicanCoke:
            return UnitVolume.fluidOunces
        case .pimms1:
            return UnitVolume.fluidOunces
        case .lemonSoda:
                return UnitVolume.fluidOunces
        case .cucumber:
            return UnitGarnish.garnish
        case .lemon:
            return UnitGarnish.garnish
        case .strawberries:
            return UnitGarnish.garnish
        case .appleSlices:
            return UnitGarnish.garnish
        case .mint:
            return UnitGarnish.garnish
        case .pisco:
            return UnitVolume.fluidOunces
        case .redWine:
            return UnitBottles.bottles
        case .oranges:
            return UnitItems.items
        case .dicedGreenApple:
            return UnitItems.items
        case .dicedLemon:
            return UnitItems.items
        case .cinnamonStick:
            return UnitItems.items
        case .agedRum:
            return UnitVolume.fluidOunces
        case .pineappleJuice:
            return UnitVolume.fluidOunces
        case .orgeatAlmondSyrup:
            return UnitVolume.fluidOunces
        case .pineappleFrond:
            return UnitGarnish.garnish
        case .cachaca:
            return UnitVolume.fluidOunces
        case .lime:
            return UnitItems.items
        case .fineSugar:
            return UnitVolume.fluidOunces
        case .blancVermouth:
            return UnitVolume.fluidOunces
        case .dryCurcacao:
            return UnitVolume.fluidOunces
        case .grenadine:
            return UnitVolume.fluidOunces
        case .whiteRum:
            return UnitVolume.fluidOunces
        case .limeWedge:
            return UnitGarnish.garnish
        case .darkRum:
            return UnitVolume.fluidOunces
        case .gingerBeer:
            return UnitVolume.fluidOunces
        case .grapefruitJucie:
            return UnitVolume.fluidOunces
        case .saltedButter:
            return UnitMass.grams
        case .brownSugar:
            return UnitVolume.tablespoons
        case .groundNutmegCinnamonAndClove:
            return UnitVolume.teaspoons
        case .vanillaIceCream:
            return UnitScoops.scoops
        case .spicedRum:
            return UnitVolume.fluidOunces
        case .hotButteredBatter:
            return UnitScoops.scoops
        case .hotWater:
            return UnitVolume.fluidOunces
        case .darkSpicedRum:
            return UnitVolume.fluidOunces
        case .passionfruitSyrup:
            return UnitVolume.fluidOunces
        case .orgeatSyrup:
            return UnitVolume.fluidOunces
        case .halfLimeAndMint:
            return UnitGarnish.garnish
        case .limeWheelAndMintSprig:
            return UnitGarnish.garnish
        case .pussersRum:
            return UnitVolume.fluidOunces
        case .cremeOfCoconut:
            return UnitVolume.fluidOunces
        case .rum151:
            return UnitVolume.fluidOunces
        case .coffee:
            return UnitVolume.fluidOunces
        case .heavyCreamAndNutmeg:
            return UnitGarnish.garnish
        case .orangeJuice:
            return UnitVolume.fluidOunces
        case .pineappleFrondsAndGroundNutmeg:
            return UnitGarnish.garnish
        case .pineappleWedgeAndCherry:
            return UnitGarnish.garnish
        case .blendedScotch:
            return UnitVolume.fluidOunces
        case .cherryHeering:
            return UnitVolume.fluidOunces
        case .orangePeelOrCherry:
            return UnitGarnish.garnish
        case .gingerSyrup:
            return UnitVolume.fluidOunces
        case .islayScotchFloat:
            return UnitGarnish.garnish
        case .candiedGinger:
            return UnitGarnish.garnish
        case .cherry:
            return UnitGarnish.garnish
        case .drambuie:
            return UnitVolume.fluidOunces
        case .aperol:
            return UnitVolume.fluidOunces
        case .prosecco:
            return UnitVolume.fluidOunces
        case .peachPuree:
            return UnitVolume.fluidOunces
        case .blancoTequila:
            return UnitVolume.fluidOunces
        case .cranberryJuice:
            return UnitVolume.fluidOunces
        case .grapefruitPeel:
            return UnitGarnish.garnish
        case .sliceOfPeach:
            return UnitGarnish.garnish
        case .orangeWedgeOrTwist:
            return UnitGarnish.garnish
        case .champagne:
            return UnitVolume.fluidOunces
        case .tripleSec:
            return UnitVolume.fluidOunces
        case .agave:
            return UnitBarSpoon.spoons
        case .agaveNectar:
            return UnitVolume.fluidOunces
        case .reposadoTequila:
            return UnitVolume.fluidOunces
        case .mezcal:
            return UnitVolume.fluidOunces
        case .greenAppleSchnapps:
            return UnitVolume.fluidOunces
        case .appleSliceOrCherry:
            return UnitGarnish.garnish
        case .tomatoJuice:
            return UnitVolume.fluidOunces
        case .worcestershire:
            return UnitVolume.teaspoons
        case .horseradish:
            return UnitVolume.teaspoons
        case .hotSauce:
            return UnitDash.dashes
        case .saltAndPepper:
            return UnitDash.dashes
        case .celery:
            return UnitGarnish.garnish
        case .raspberryLiqueur:
            return UnitVolume.fluidOunces
        case .raspberriesOrPineappleWedgeOrLemontTwist:
            return UnitGarnish.garnish
        case .espresso:
            return UnitShot.shots
        case .coffeBeans:
            return UnitItems.items
        case .grapefruitWedge:
            return UnitGarnish.garnish
        case .fuzzyNavelPeachSchnapps:
            return UnitVolume.fluidOunces
        case .galliano:
            return UnitVolume.fluidOunces
        case .orangeWedgeOrCherry:
            return UnitGarnish.garnish
        case .hairyNavelPeachSchnapps:
            return UnitVolume.fluidOunces
        case .hairyNavelVodka:
            return UnitVolume.fluidOunces
        case .peachschnapps:
            return UnitVolume.fluidOunces
        case .orangeWheelAndCherry:
            return UnitGarnish.garnish
        case .whiskey:
            return UnitVolume.fluidOunces
        case .blackWalnutBitters:
            return UnitDash.dashes
        case .realMapleSyrup:
            return UnitBarSpoon.spoons
        case .demeraraSyrup:
            return UnitVolume.fluidOunces
        case .amaroNonino:
            return UnitVolume.fluidOunces
        case .fernetBranca:
            return UnitVolume.fluidOunces
        case .crownRoyal:
            return UnitVolume.fluidOunces
        case .sourAppleSchnapps:
            return UnitVolume.fluidOunces
        }
    }
    
    static var garnishes: [IngredientType] {
        return IngredientType.allCases.filter { type in
            type.units == UnitGarnish.garnish
        }.sorted(by: <)
    }
    
    static var ounces: [IngredientType] {
        return IngredientType.allCases.filter { type in
            type.units == UnitVolume.fluidOunces
        }.sorted(by: <)
    }
    
    static var items: [IngredientType] {
        return IngredientType.allCases.filter { type in
            type.units == UnitItems.items
        }.sorted(by: <)
    }
    
    static var dashes: [IngredientType] {
        return IngredientType.allCases.filter { type in
            type.units == UnitDash.dashes
        }.sorted(by: <)
    }
    
    static var otherTypes: [IngredientType] {
        return IngredientType.allCases.filter { type in
            type.units != UnitGarnish.garnish && type.units != UnitDash.dashes && type.units != UnitItems.items && type.units != UnitVolume.fluidOunces
        }.sorted(by: <)
    }
    
    static func < (lhs: IngredientType, rhs: IngredientType) -> Bool {
        lhs.name < rhs.name
    }
    
    var id: Self { return self }
    
}

enum Glass: Codable, Hashable, CaseIterable {
    case rocks, doubleRocks, coupe, smallCoupe, martini, stemmed, coffee, nickAndNora, collins, margarita, doubleOldFashioned, hurricane, tiki, wine, champagneFlute, copperMug
    
    var name: String {
        switch self {
        case .rocks:
            return "Rocks"
        case .doubleRocks:
            return "Double Rocks"
        case .coupe:
            return "Coupe"
        case .smallCoupe:
            return "Small Coupe"
        case .martini:
            return "Martini"
        case .stemmed:
            return "Stemmed"
        case .coffee:
            return "Coffee"
        case .nickAndNora:
            return "Nick and Nora"
        case .collins:
            return "Collins"
        case .margarita:
            return "Margarita"
        case .doubleOldFashioned:
            return "Double Old Fashioned"
        case .hurricane:
            return "Hurricane"
        case .tiki:
            return "Tiki"
        case .wine:
            return "Wine"
        case .champagneFlute:
            return "Champagne Flute"
        case .copperMug:
            return "Copper Mug"
        }
    }
    
    static func < (lhs: Glass, rhs: Glass) -> Bool {
        lhs.name < rhs.name
    }
    
}

typealias Glasses = [Glass]
extension Glasses {
    
    /// Returns a list of glasses in a natural way. For example: "Rocks, Martini, or Coupe Glass"
    var list: String {
        var options: [String] = []
        for glass in self {
            options.append(glass.name)
        }
        var list = ListFormatter.localizedString(byJoining: options)
        list = list.replacingOccurrences(of: " and ", with: " or ")
        return "\(list) Glass"
    }
    
}

enum Item: Codable, Hashable, CaseIterable {
    case shaker, jigger, barSpoon, strainer, fineStrainer, juicer, microplane, muddler, glass(_ kind: Glass), glasses(_ kinds: [Glass]), mixingGlass, yPeeler, hawthorneStrainer, lewisBag, fineMeshStrainer, channelKnife, barKnife, pitcher, measuringCups, blender, longLighterOrMatch, coffeeCup, custom(_ name: String)
    
    static var allCases: [Item] {
        
        return [.shaker, .jigger, .barSpoon, .strainer, .fineStrainer, .juicer, .microplane, .muddler, .mixingGlass, .yPeeler, .hawthorneStrainer, .lewisBag, .fineMeshStrainer, .channelKnife, .barKnife, .pitcher, .measuringCups, .blender, .longLighterOrMatch, .coffeeCup].sorted(by: <)
        
    }
    
    var name: String {
        switch self {
        case .shaker:
            return "Shaker"
        case .jigger:
            return "Jigger"
        case .barSpoon:
            return "Bar Spoon"
        case .strainer:
            return "Strainer"
        case .fineStrainer:
            return "Fine Strainer"
        case .juicer:
            return "Juicer"
        case .microplane:
            return "Microplane"
        case .muddler:
            return "Muddler"
        case .glass(let kind):
            return "\(kind.name) Glass"
        case .glasses(let kinds):
            return kinds.list
        case .mixingGlass:
            return "Mixing Glass"
        case .yPeeler:
            return "Y-Peeler"
        case .hawthorneStrainer:
            return "Hawthorne Strainer"
        case .lewisBag:
            return "Lewis Bag"
        case .fineMeshStrainer:
            return "Fine Mesh Strainer"
        case .channelKnife:
            return "Channel Knife"
        case .barKnife:
            return "Bar Knife"
        case .pitcher:
            return "Pitcher"
        case .measuringCups:
            return "Measuring Cups"
        case .blender:
            return "Blender"
        case .longLighterOrMatch:
            return "Long Lighter or Match"
        case .coffeeCup:
            return "Coffee Cup"
        case .custom(let name):
            return name
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func <(lhs: Item, rhs: Item) -> Bool {
        lhs.name < rhs.name
    }
    
}

typealias Items = [Item]
extension Items {
    
    /// Returns a list of glasses in a natural way. For example: "Rocks, Martini, or Coupe Glass"
    var list: String {
        var options: [String] = []
        for item in self {
            options.append(item.name)
        }
        return ListFormatter.localizedString(byJoining: options)
    }
    
}
