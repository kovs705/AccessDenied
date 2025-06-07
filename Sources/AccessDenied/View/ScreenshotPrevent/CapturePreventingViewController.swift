//
//  CapturePreventingViewController.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import UIKit
import SwiftUI

final class CapturePreventingViewController<Content: View>: UIViewController {
    
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
    
    private let shouldPreventCapture: Bool
    private let content: () -> Content
    
    init(_ shouldPreventCapture: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.shouldPreventCapture = shouldPreventCapture
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
