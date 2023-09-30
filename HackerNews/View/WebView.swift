//
//  WebView.swift
//  HackerNews
//
//  Created by 笑 on 2023/9/29.
//

import Foundation
import SwiftUI
import WebKit

struct WebView {
    
    let urlString: String?
    @Binding var isLoading: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeWebView(context: Context) -> WKWebView {
        let webView =  WKWebView()
        webView.navigationDelegate = context.coordinator
        if let safeString = urlString, let url = URL(string: safeString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
            
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
    }
}

#if os(macOS)
extension WebView: NSViewRepresentable {
    func makeNSView(context: Context) -> some NSView {
        makeWebView(context: context)
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
}

#else
extension WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        makeWebView(context: context)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
#endif
