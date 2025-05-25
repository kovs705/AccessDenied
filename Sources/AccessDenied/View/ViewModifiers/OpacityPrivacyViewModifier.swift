//
//  OpacityPrivacyViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct OpacityPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) private var scenePhase
    
    func body(content: Content) -> some View {
        content
            .opacity(scenePhase != .active ? 0 : 1)
            .animation(.default, value: scenePhase)
    }
}
