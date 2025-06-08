//
//  CapturePreventingViewController.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import UIKit
import SwiftUI

/// A UIViewController that prevents its content from being captured in screenshots or screen recordings.
final class CapturePreventingViewController<Content: View>: UIViewController {
    
    /// A secure container view that prevents content capture.
    /// This view uses UITextField's secure text entry feature to prevent screen capture.
    private lazy var secureContainerView: UIView? = {
        $0.isUserInteractionEnabled = false
        $0.isSecureTextEntry = shouldPreventCapture
        let canvasView = $0.subviews.first {
            let className = String(describing: type(of: $0))
            return className.starts(with: "_") && className.contains("CanvasView")
        }
        canvasView?.isUserInteractionEnabled = true
        return canvasView
    }(UITextField())
    
    /// Determines whether screenshot prevention should be enabled.
    private let shouldPreventCapture: Bool
    
    /// The content view builder that provides the SwiftUI content to be displayed.
    private let content: () -> Content
    
    /// Initializes a new capture-preventing view controller.
    /// - Parameters:
    ///   - shouldPreventCapture: A boolean value that determines whether screenshot prevention should be enabled.
    ///   - content: A view builder closure that provides the SwiftUI content to be displayed.
    init(_ shouldPreventCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.shouldPreventCapture = shouldPreventCapture
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the view controller's view hierarchy and sets up the secure container.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let secureContainerView else { return }
        
        view.addSubview(secureContainerView)
        secureContainerView.fillToSuperview()
        
        let host = UIHostingController(rootView: content())
        addChild(host)
        secureContainerView.addSubview(host.view)
        host.view.fillToSuperview()
        host.didMove(toParent: self)
    }
}
