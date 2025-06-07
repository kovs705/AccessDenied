//
//  AccessDenied.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
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
    
    /// Prevents screenshots and screen recordings of the view
    /// - Parameters:
    ///   - style: each style represents different content cover, but only `.custom` is customizable (yet)
    ///   - isEnabled: Whether to enable screenshot prevention
    @ViewBuilder func preventScreenshot(_ style: PrivacySensitiveStyle, isEnabled: Bool = true) -> some View {
        if isEnabled {
            switch style {
            case .default:
                preventScreenshot(true) { Color.black }
            case .redacted:
                preventScreenshot(true) { Color.black.redacted(reason: .placeholder) }
            case .blur:
                preventScreenshot(true) { Color.black.blur(radius: 5) }
            case .opacity:
                preventScreenshot(true) { Color.black.opacity(0.5) }
            case .custom(let color, let cornerRadius):
                preventScreenshot(true) { color.clipShape(.rect(cornerRadius: cornerRadius)) }
            }
        } else {
            self
        }
    }
    
    /// Prevents screenshots and screen recordings of the view with a custom mask
    /// - Parameters:
    ///   - isEnabled: Whether to enable screenshot prevention
    ///   - mask: The view to show when a screenshot is attempted
    @ViewBuilder func preventScreenshot<Mask: View>(_ isEnabled: Bool = true, @ViewBuilder withMask mask: () -> Mask) -> some View {
        if isEnabled {
            ScreenshotPreventView(content: self, mask: mask())
        } else {
            self
        }
    }
}
