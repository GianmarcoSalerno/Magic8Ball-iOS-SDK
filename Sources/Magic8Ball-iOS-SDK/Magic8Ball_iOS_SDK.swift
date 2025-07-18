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
    private let cornerRadius: CGFloat
    private let onLoad: (() -> Void)?
    private let onError: ((Error) -> Void)?
    
    public init(
        theme: Magic8BallTheme = .auto,
        cornerRadius: CGFloat = 0,
        onLoad: (() -> Void)? = nil,
        onError: ((Error) -> Void)? = nil
    ) {
        self.theme = theme
        self.cornerRadius = cornerRadius
        self.onLoad = onLoad
        self.onError = onError
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.layer.cornerRadius = cornerRadius
        webView.layer.masksToBounds = true
        webView.navigationDelegate = context.coordinator
        
        // Apply theme-based styling
        applyTheme(to: webView)
        
        // Load with simple cache policy
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.cachePolicy = .returnCacheDataElseLoad
            webView.load(request)
        }
        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.layer.cornerRadius = cornerRadius
        applyTheme(to: uiView)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
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
    
    public class Coordinator: NSObject, WKNavigationDelegate {
        var parent: Magic8BallView
        
        init(_ parent: Magic8BallView) {
            self.parent = parent
        }
        
        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Add a small delay to ensure the page is fully interactive
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.parent.onLoad?()
            }
        }
        
        public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.onError?(error)
        }
        
        public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            // Page started loading
        }
    }
}
