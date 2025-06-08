//
//  UIView+Superview.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import UIKit

extension UIView {
    /// Makes the view fill its superview by setting up constraints to all edges.
    /// This method sets up constraints to match the view's frame to its superview's bounds.
    /// If the view has no superview, this method does nothing.
    func fillToSuperview() {
        guard let superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
}
