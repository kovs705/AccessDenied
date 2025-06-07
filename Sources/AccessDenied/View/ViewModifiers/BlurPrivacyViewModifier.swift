//
//  BlurPrivacyViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct BlurPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) private var scenePhase
    
    func body(content: Content) -> some View {
        content
            .blur(radius: (scenePhase != .active) ? 5 : 0)
            .animation(.default, value: scenePhase)
    }
}
