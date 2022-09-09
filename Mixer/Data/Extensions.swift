//
//  Extensions.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
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
    
    static var background: Color {
        #if os(iOS)
        return Color(uiColor: .systemGroupedBackground)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var background2: Color {
        #if os(iOS)
        return Color(uiColor: .secondarySystemGroupedBackground)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var background3: Color {
        #if os(iOS)
        return Color(uiColor: .tertiarySystemGroupedBackground)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var label: Color {
        #if os(iOS)
        return Color(uiColor: .label)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var label2: Color {
        #if os(iOS)
        return Color(uiColor: .secondaryLabel)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var label3: Color {
        #if os(iOS)
        return Color(uiColor: .tertiaryLabel)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var label4: Color {
        #if os(iOS)
        return Color(uiColor: .quaternaryLabel)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var fill: Color {
        #if os(iOS)
        return Color(uiColor: .systemFill)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var fill2: Color {
        #if os(iOS)
        return Color(uiColor: .secondarySystemFill)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var fill3: Color {
        #if os(iOS)
        return Color(uiColor: .tertiarySystemFill)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
    static var fill4: Color {
        #if os(iOS)
        return Color(uiColor: .quaternarySystemFill)
        #else
        return Color(nsColor: .windowBackgroundColor)
        #endif
    }
    
}

extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension View {
    
    func backgroundGradient() -> some View {
        return self.background(LinearGradient(colors: [Color.clear, Color.black.opacity(0.75)], startPoint: .top, endPoint: .bottom))
    }
    
}

extension String {
    
    var asFraction: String {
        let quarter = self.replacingOccurrences(of: "0.25", with: "¼")
        let half = quarter.replacingOccurrences(of: "0.5", with: "½")
        let threeQuarters = half.replacingOccurrences(of: "0.75", with: "¾")
        
        let quarter2 = threeQuarters.replacingOccurrences(of: ".25", with: " ¼")
        let half2 = quarter2.replacingOccurrences(of: ".5", with: " ½")
        let threeQuarters2 = half2.replacingOccurrences(of: ".75", with: " ¾")
        
        return threeQuarters2
    }
}
