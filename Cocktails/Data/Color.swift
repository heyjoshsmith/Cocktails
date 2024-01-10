//
//  Color.swift
//  Cocktails
//
//  Created by Josh Smith on 9/12/22.
//

import SwiftUI

extension Color {
    
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
