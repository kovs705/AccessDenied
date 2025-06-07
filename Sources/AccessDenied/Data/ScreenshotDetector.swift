//
//  ScreenshotDetector.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI
import UIKit
import Combine

class ScreenshotDetector: ObservableObject {
    @Published var isTakingScreenshot = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        #if os(iOS)
        NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isTakingScreenshot = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                    guard let self else { return }
                    isTakingScreenshot = false
                }
            }
            .store(in: &cancellables)
        #endif
    }
    
    deinit {
        cancellables.removeAll()
    }
}
