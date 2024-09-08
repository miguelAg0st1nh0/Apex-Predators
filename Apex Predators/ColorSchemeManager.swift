//
//  ColorSchemeManager.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 05/09/2024.
//

import SwiftUI

struct ColorSchemeManager {
    
    static func dynamicColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .white : .black
    }
    
    ///Returns the same color as the current color scheme when using @Environment
    static func returnSameColorScheme(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .black : .white
    }
}
