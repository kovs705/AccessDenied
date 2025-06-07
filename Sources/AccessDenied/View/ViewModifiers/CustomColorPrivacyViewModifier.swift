//
//  CustomColorPrivacyViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct CustomColorPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.screenshotDetector) private var screenshotDetector
    var color: Color
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                color
                    .opacity((scenePhase != .active || screenshotDetector.isTakingScreenshot) ? 1 : 0)
                    .clipShape(.rect(cornerRadius: cornerRadius))
            }
            .animation(.default, value: scenePhase)
            .animation(.default, value: screenshotDetector.isTakingScreenshot)
    }
}
