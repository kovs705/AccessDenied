//
//  RedactedPrivacyViewModifier.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 25.05.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct RedactedPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) private var scenePhase
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: scenePhase == .active ? .init() : .placeholder)
            .animation(.default, value: scenePhase)
    }
}
