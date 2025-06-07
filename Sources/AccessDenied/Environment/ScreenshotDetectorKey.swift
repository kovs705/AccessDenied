//
//  ScreenshotDetectorKey.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct ScreenshotDetectorKey: EnvironmentKey {
    static let defaultValue = ScreenshotDetector()
}

extension EnvironmentValues {
    var screenshotDetector: ScreenshotDetector {
        get { self[ScreenshotDetectorKey.self] }
        set { self[ScreenshotDetectorKey.self] = newValue }
    }
} 
