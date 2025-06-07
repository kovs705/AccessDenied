//
//  SceneCaptureKey.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

@available(iOS 17.0, *)
private struct SceneCaptureKey: EnvironmentKey {
    static let defaultValue = false
}

@available(iOS 17.0, *)
extension EnvironmentValues {
    var isSceneCaptured: Bool {
        get { self[SceneCaptureKey.self] }
        set { self[SceneCaptureKey.self] = newValue }
    }
}
