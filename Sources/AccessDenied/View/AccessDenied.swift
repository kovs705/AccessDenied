//
//  AccessDenied.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//

import SwiftUI

public extension View {
    /// View method to hide content when user makes a schreenshot or app goes in background
    /// - Parameters:
    ///   - style: each style represents different content cover, but only `.custom` is customizable (yet)
    ///   - isEnabled: if `== true` -> automatically hides content. Can be turn off completely by assigning `false`
    @ViewBuilder func privacySensitive(_ style: PrivacySensitiveStyle, isEnabled: Bool = true) -> some View {
        Group {
            if isEnabled {
                switch style {
                case .default:
                    privacySensitive()
                case .redacted:
                    modifier(RedactedPrivacyViewModifier())
                case .blur:
                    modifier(BlurPrivacyViewModifier())
                case .opacity:
                    modifier(OpacityPrivacyViewModifier())
                case .custom(let color, let cornerRadius):
                    modifier(CustomColorPrivacyViewModifier(color: color, cornerRadius: cornerRadius))
                }
            } else {
                self
            }
        }
        
    }
}
