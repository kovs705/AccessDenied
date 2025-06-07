//
//  CapturePreventingView.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct CapturePreventingView<Content: View>: UIViewControllerRepresentable {
    private let shouldPreventCapture: Bool
    private let content: () -> Content
    
    init(_ shouldPreventCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.shouldPreventCapture = shouldPreventCapture
        self.content = content
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        CapturePreventingViewController(
            shouldPreventCapture,
            content: content
        )
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
}
