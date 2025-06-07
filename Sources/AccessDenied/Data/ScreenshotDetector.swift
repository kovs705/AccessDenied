//
//  ScreenshotDetector.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI
import UIKit

class ScreenshotDetector: ObservableObject {
    @Published var isTakingScreenshot = false
    
    init() {
        #if os(iOS)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenshotTaken),
            name: UIApplication.userDidTakeScreenshotNotification,
            object: nil
        )
        #endif
    }
    
    @objc private func screenshotTaken() {
        DispatchQueue.main.async {
            self.isTakingScreenshot = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                guard let self else { return }
                isTakingScreenshot = false
            }
        }
    }
}


