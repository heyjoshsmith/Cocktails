//
//  Color Hex.swift
//  Cocktails
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

extension Color {
    
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        // Scanner creation
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let grey = Int(color) & mask
            
            let gray = Double(grey) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let grey = Int(color >> 8) & mask
            let alphaInt = Int(color) & mask
            
            let gray = Double(grey) / 255.0
            let alpha = Double(alphaInt) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let redInt = Int(color >> 16) & mask
            let greenInt = Int(color >> 8) & mask
            let blueInt = Int(color) & mask
            
            let red = Double(redInt) / 255.0
            let green = Double(greenInt) / 255.0
            let blue = Double(blueInt) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let redInt = Int(color >> 24) & mask
            let greenInt = Int(color >> 16) & mask
            let blueInt = Int(color >> 8) & mask
            let alphaInt = Int(color) & mask
            
            let red = Double(redInt) / 255.0
            let green = Double(greenInt) / 255.0
            let blue = Double(blueInt) / 255.0
            let alpha = Double(alphaInt) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
            
        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
