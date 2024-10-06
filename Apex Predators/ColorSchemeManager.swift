//
//  ColorSchemeManager.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 05/09/2024.
//

import SwiftUI

/// A utility struct to manage color schemes and dynamically return colors based on the current color scheme.
struct ColorSchemeManager {
    
    /// This static function returns a dynamic color based on the current `ColorScheme`.
    /// - Parameter colorScheme: The current color scheme (either `.light` or `.dark`).
    /// - Returns: If the color scheme is dark, it returns `.white`; otherwise, it returns `.black`.
    static func dynamicColor(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .white : .black
    }
    
    /// This static function returns a color that matches the current color scheme, useful when using the `@Environment` property wrapper.
    /// - Parameter colorScheme: The current color scheme (either `.light` or `.dark`).
    /// - Returns: If the color scheme is dark, it returns `.black`; otherwise, it returns `.white`.
    /// This function essentially reverses the logic of the `dynamicColor` function.
    static func returnSameColorScheme(for colorScheme: ColorScheme) -> Color {
        return colorScheme == .dark ? .black : .white
    }
}
