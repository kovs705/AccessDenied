//
//  SecureViewRepresentable.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI
import UIKit

struct SecureViewRepresentable<Content: View>: UIViewRepresentable {
    var content: Content
    let frame: CGRect

    public func makeUIView(context: Context) -> UIView {
        let secureTextField = UITextField()
        secureTextField.isSecureTextEntry = true
        secureTextField.isUserInteractionEnabled = false
        
        guard let secureView = secureTextField.subviews.first else {
            return UIView()
        }

        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        hostingController.view.frame = frame
        
        secureView.addSubview(hostingController.view)
        return secureView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
} 