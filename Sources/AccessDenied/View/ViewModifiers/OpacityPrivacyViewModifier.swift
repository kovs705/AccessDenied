//
//  OpacityPrivacyViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct OpacityPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.screenshotDetector) private var screenshotDetector
    
    func body(content: Content) -> some View {
        content
            .opacity((scenePhase == .active && !screenshotDetector.isTakingScreenshot) ? 1 : 0)
            .animation(.default, value: scenePhase)
            .animation(.default, value: screenshotDetector.isTakingScreenshot)
    }
}
