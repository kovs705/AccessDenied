//
//  ScreenshotPreventView.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

@available(iOS 17.0, *)
private struct ScreenshotDetector: ViewModifier {
    @Environment(\.isSceneCaptured) private var isSceneCaptured
    @Binding var isCaptured: Bool
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isSceneCaptured) { _, newValue in
                isCaptured = newValue
            }
    }
}

struct ScreenshotPreventView<Content: View, Mask: View>: View {
    var content: Content
    var mask: Mask
    @State var frame: CGRect?
    @Environment(\.scenePhase) private var scenePhase
    @State private var isCaptured: Bool = false
    
    var body: some View {
        Group {
            if let frame {
                ZStack(alignment: .center) {
                    if isCaptured {
                        mask
                    } else {
                        SecureViewRepresentable(content: content, frame: frame)
                    }
                }
                .frame(width: frame.width, height: frame.height)
                .modifier(ScreenshotDetectorWrapper(isCaptured: $isCaptured))
            } else {
                ZStack(alignment: .center) {
                    if isCaptured {
                        mask
                    } else {
                        content
                    }
                }
                .overlay {
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                frame = geometry.frame(in: .local)
                            }
                    }
                }
                .modifier(ScreenshotDetectorWrapper(isCaptured: $isCaptured))
            }
        }
        .animation(.default, value: scenePhase)
    }
}

private struct ScreenshotDetectorWrapper: ViewModifier {
    @Binding var isCaptured: Bool
    
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content.modifier(ScreenshotDetector(isCaptured: $isCaptured))
        } else {
            content
        }
    }
} 
