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
        // Configure WKWebView with aggressive caching for offline support
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = WKWebsiteDataStore.default()
        
        // Set cache policy to use cached data when available
        let processPool = WKProcessPool()
        configuration.processPool = processPool
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.layer.cornerRadius = cornerRadius
        webView.layer.masksToBounds = true
        webView.navigationDelegate = context.coordinator
        
        // Apply theme-based styling
        applyTheme(to: webView)
        
        // Load with aggressive cache policy for offline support
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            // Use cached data if available, even if expired
            request.cachePolicy = .returnCacheDataElseLoad
            // Set cache control headers for better offline support
            request.setValue("max-age=3600", forHTTPHeaderField: "Cache-Control")
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
            // Check if this is a network error and try to load from cache
            let nsError = error as NSError
            if nsError.domain == NSURLErrorDomain && 
               (nsError.code == NSURLErrorNotConnectedToInternet || 
                nsError.code == NSURLErrorNetworkConnectionLost) {
                // Try to reload with cache-only policy for offline fallback
                if let url = URL(string: parent.urlString) {
                    var request = URLRequest(url: url)
                    request.cachePolicy = .returnCacheDataDontLoad
                    webView.load(request)
                }
            } else {
                parent.onError?(error)
            }
        }
        
        public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            // Page started loading
        }
        
        public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            // Handle provisional navigation failures (like network errors)
            let nsError = error as NSError
            if nsError.domain == NSURLErrorDomain && 
               (nsError.code == NSURLErrorNotConnectedToInternet || 
                nsError.code == NSURLErrorNetworkConnectionLost) {
                // Try cache-only fallback
                if let url = URL(string: parent.urlString) {
                    var request = URLRequest(url: url)
                    request.cachePolicy = .returnCacheDataDontLoad
                    webView.load(request)
                }
            } else {
                parent.onError?(error)
            }
        }
    }
}
