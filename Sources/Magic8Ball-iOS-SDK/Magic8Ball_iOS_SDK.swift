// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import WebKit

@available(iOS 14.0, *)
public enum Magic8BallTheme {
    case light
    case dark
    case auto
}

@available(iOS 14.0, *)
public struct Magic8BallView: UIViewRepresentable {
    private let urlString = "https://xvehl58kcb.appflowapp.com/chat"
    private let theme: Magic8BallTheme
    private let backgroundColor: Color
    private let cornerRadius: CGFloat
    
    public init(
        theme: Magic8BallTheme = .auto,
        backgroundColor: Color = .clear,
        cornerRadius: CGFloat = 0
    ) {
        self.theme = theme
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // Set WebView background with proper color conversion
        if backgroundColor != .clear {
            webView.backgroundColor = UIColor(backgroundColor)
        } else {
            webView.backgroundColor = .systemBackground
        }
        
        webView.layer.cornerRadius = cornerRadius
        webView.layer.masksToBounds = true
        
        // Apply theme-based styling
        applyTheme(to: webView)
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update styling if needed
        if backgroundColor != .clear {
            uiView.backgroundColor = UIColor(backgroundColor)
        } else {
            uiView.backgroundColor = .systemBackground
        }
        
        uiView.layer.cornerRadius = cornerRadius
        applyTheme(to: uiView)
    }
    
    private func applyTheme(to webView: WKWebView) {
        switch theme {
        case .light:
            webView.overrideUserInterfaceStyle = .light
        case .dark:
            webView.overrideUserInterfaceStyle = .dark
        case .auto:
            webView.overrideUserInterfaceStyle = .unspecified
        }
    }
}
