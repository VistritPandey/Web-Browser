//
//  WKView.swift
//  Web Browser
//
//  Created by Vistrit Pandey on 8/21/22.
//

import SwiftUI
import WebKit

struct WKView:UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    @ObservedObject var webView: WebView
    typealias UIViewType = WKWebView
    
    class Coordinator: NSObject,WKNavigationDelegate {
        let parent:WKView
        init(_ parent:WKView) {
            self.parent = parent
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webView.goBack{
                webView.goBack()
                parent.webView.goBack = false
            }
            if parent.webView.goForward{
                webView.goForward()
                parent.webView.goForward = false
            }
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: CGRect.zero)
        view.navigationDelegate = context.coordinator
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.isScrollEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: webView.pageTitle)!))
        if webView.goToPage{
            uiView.load(URLRequest(url: URL(string: webView.pageTitle)!))
            webView.goToPage = false
        }
    }
}
