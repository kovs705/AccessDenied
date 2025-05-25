//
//  File.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//

import SwiftUI

public extension View {
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
