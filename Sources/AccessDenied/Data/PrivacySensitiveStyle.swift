//
//  PrivacySensitiveStyle.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

public enum PrivacySensitiveStyle {
    case `default`
    case redacted
    case blur
    case opacity
    case custom(color: Color, cornerRadius: CGFloat)
}
