//
//  Person.swift
//  Cocktails
//
//  Created by Josh Smith on 7/16/23.
//

import SwiftUI
import SwiftData

@Model final class Person {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var shortName: String {
        if let lastInitial = lastName.first {
            return "\(firstName) \(lastInitial)."
        } else {
            return firstName
        }
    }
    
}

enum Flavor: String, CaseIterable {
    case sweet
}

