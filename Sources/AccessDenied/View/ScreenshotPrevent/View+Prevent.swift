//
//  View+Prevent.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

public extension View {
    /// Prevents the view from being captured in screenshots or screen recordings.
    /// - Parameter shouldPreventCapture: A boolean value that determines whether screenshot prevention should be enabled. Defaults to true.
    /// - Returns: A modified view that prevents capture when enabled.
    func preventCapture(_ shouldPreventCapture: Bool = true) -> some View {
        modifier(CapturePreventingModifier(shouldPreventCapture: shouldPreventCapture))
    }
}
 
/// A view modifier that implements screenshot prevention functionality.
private struct CapturePreventingModifier: ViewModifier {
    /// Determines whether screenshot prevention should be enabled.
    let shouldPreventCapture: Bool
 
    /// Applies the screenshot prevention functionality to the content view.
    /// - Parameter content: The content view to be modified.
    /// - Returns: A view with screenshot prevention enabled.
    func body(content: Content) -> some View {
        CapturePreventingView(shouldPreventCapture) {
            content
        }
    }
}
