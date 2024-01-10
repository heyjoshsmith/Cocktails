//
//  Columns.swift
//  Cocktails
//
//  Created by Josh Smith on 8/25/22.
//

import SwiftUI

typealias Columns = [GridItem]
extension Columns {
    
    init(_ number: Int) {
        var results = Columns()
        
        for _ in 0..<number {
            results.append(GridItem(.flexible()))
        }
        
        self = results
    }
    
}
