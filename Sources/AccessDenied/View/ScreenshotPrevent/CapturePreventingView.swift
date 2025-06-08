//
//  CapturePreventingView.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct CapturePreventingView<Content: View>: UIViewControllerRepresentable {
    /// Determines whether screenshot prevention should be enabled.
    private let shouldPreventCapture: Bool
    
    /// The content view builder that provides the SwiftUI content to be displayed.
    private let content: () -> Content
    
    /// Initializes a new capture-preventing view.
    /// - Parameters:
    ///   - shouldPreventCapture: A boolean value that determines whether screenshot prevention should be enabled.
    ///   - content: A view builder closure that provides the SwiftUI content to be displayed.
    init(_ shouldPreventCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.shouldPreventCapture = shouldPreventCapture
        self.content = content
    }
    
    /// Creates and returns a new UIViewController instance that prevents content capture.
    /// - Parameter context: The context in which the view controller is created.
    /// - Returns: A new CapturePreventingViewController instance.
    func makeUIViewController(context: Context) -> UIViewController {
        CapturePreventingViewController(
            shouldPreventCapture,
            content: content
        )
    }
    
    /// Updates the UIViewController when the SwiftUI view updates.
    /// - Parameters:
    ///   - uiViewController: The view controller to update.
    ///   - context: The context in which the update occurs.
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
}
