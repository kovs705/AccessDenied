//
//  ScreenshotDetectorViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

@available(iOS 17.0, *)
struct ScreenshotDetectorViewModifier: ViewModifier {
    @Environment(\.screenshotDetector) private var screenshotDetector
    @Environment(\.isSceneCaptured) private var isSceneCaptured
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isSceneCaptured) { _, newValue in
                if newValue {
                    screenshotDetector.isTakingScreenshot = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        screenshotDetector.isTakingScreenshot = false
                    }
                }
            }
    }
}

@available(iOS 17.0, *)
extension View {
    func detectScreenshots() -> some View {
        modifier(ScreenshotDetectorViewModifier())
    }
}
