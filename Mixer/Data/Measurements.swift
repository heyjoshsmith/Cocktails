//
//  Measurements.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import Foundation

// Measurements

/// Measures how many "Dashes" of something you add to a recipe.
class UnitDash: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitDash.dashes as! Self
    }

    static let dashes = UnitDash(symbol: "dash(es)", converter: UnitConverterLinear(coefficient: 1.0))
    
}

/// An ingredient you add to a recipe as a "Garnish" (mostly decoration).
class UnitGarnish: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitGarnish.garnish as! Self
    }

    static let garnish = UnitGarnish(symbol: "garnish", converter: UnitConverterLinear(coefficient: 1.0))
    
}

/// Measures how many of the selected ingridient you add to a recipe. Measured in units.
class UnitItems: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitItems.items as! Self
    }

    static let items = UnitItems(symbol: "", converter: UnitConverterLinear(coefficient: 1.0))
    
}

class UnitBottles: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitBottles.bottles as! Self
    }

    static let bottles = UnitBottles(symbol: "bottle(s)", converter: UnitConverterLinear(coefficient: 1.0))
    
}

class UnitShot: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitShot.shots as! Self
    }

    static let shots = UnitShot(symbol: "shot(s)", converter: UnitConverterLinear(coefficient: 1.0))
    
}

class UnitBarSpoon: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitBarSpoon.spoons as! Self
    }

    static let spoons = UnitBarSpoon(symbol: "bar spoon(s)", converter: UnitConverterLinear(coefficient: 1.0))
    
}

class UnitScoops: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitScoops.scoops as! Self
    }

    static let scoops = UnitScoops(symbol: "scoop(s)", converter: UnitConverterLinear(coefficient: 1.0))
    
}

/// Used to "Top Off" or fill remainder of receipe.
class UnitFill: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitFill.fill as! Self
    }

    static let fill = UnitFill(symbol: "Top Off", converter: UnitConverterLinear(coefficient: 1.0))
    
}

/// Empty units.
class UnitNone: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitNone.none as! Self
    }

    static let none = UnitNone(symbol: "", converter: UnitConverterLinear(coefficient: 1.0))
    
}

/// Empty units.
class UnitDrops: Dimension {
    
    override static func baseUnit() -> Self {
        return UnitDrops.drops as! Self
    }

    static let drops = UnitDrops(symbol: "drops", converter: UnitConverterLinear(coefficient: 1.0))
    
}
