//
//  Extensions.swift
//  Cocktails
//
//  Created by Josh Smith on 2/25/22.
//

import SwiftUI

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
    
    func backgroundGradient(_ direction: [UnitPoint]? = [.top, .bottom]) -> some View {
        return self.background(LinearGradient(colors: [Color.clear, Color.black.opacity(0.75)], startPoint: direction![0], endPoint: direction![1]))
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
