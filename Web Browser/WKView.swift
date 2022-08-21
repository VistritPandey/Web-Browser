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
    
    @ObservedObject var webViewStateModel: WebView
    typealias UIViewType = WKWebView
    
    class Coordinator: NSObject,WKNavigationDelegate {
        let parent:WKView
        init(_ parent:WKView) {
            self.parent = parent
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webViewStateModel.goBack{
                webView.goBack()
                parent.webViewStateModel.goBack = false
            }
            if parent.webViewStateModel.goForward{
                webView.goForward()
                parent.webViewStateModel.goForward = false
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
        uiView.load(URLRequest(url: URL(string: webViewStateModel.pageTitle)!))
        if webViewStateModel.goToPage{
            uiView.load(URLRequest(url: URL(string: webViewStateModel.pageTitle)!))
            webViewStateModel.goToPage = false
        }
    }
}
