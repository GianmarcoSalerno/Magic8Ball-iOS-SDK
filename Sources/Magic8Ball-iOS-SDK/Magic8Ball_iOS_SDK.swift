// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import WebKit

public struct Magic8BallView: UIViewRepresentable {
    private let urlString = "https://xvehl58kcb.appflowapp.com/chat"

    public init() {}

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
        // No-op for now
    }
}
