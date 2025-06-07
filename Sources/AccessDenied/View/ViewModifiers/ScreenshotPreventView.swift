//
//  ScreenshotPreventView.swift
//  AccessDenied
//
//  Created by Eugene Kovs on 07.06.2025.
//  https://github.com/kovs705
//

import SwiftUI

struct ScreenshotPreventView<Content: View, Mask: View>: View {
    var content: Content
    var mask: Mask
    @State var frame: CGRect?
    
    var body: some View {
        Group {
            if let frame {
                ZStack(alignment: .center) {
                    mask
                    SecureViewRepresentable(content: content, frame: frame)
                }
                .frame(width: frame.width, height: frame.height)
            } else {
                ZStack(alignment: .center) {
                    mask
                    content
                }
                .overlay {
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                frame = geometry.frame(in: .local)
                            }
                    }
                }
            }
        }
    }
} 