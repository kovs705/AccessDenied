//
//  View+Prevent.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

public extension View {
    func preventCapture(_ shouldPreventCapture: Bool) -> some View {
        modifier(CapturePreventingModifier(shouldPreventCapture: shouldPreventCapture))
    }
}
 
private struct CapturePreventingModifier: ViewModifier {
    let shouldPreventCapture: Bool
 
    func body(content: Content) -> some View {
        CapturePreventingView(shouldPreventCapture) {
            content
        }
    }
}
