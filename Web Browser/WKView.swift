//
//  WKView.swift
//  Web Browser
//
//  Created by Vistrit Pandey on 8/21/22.
//

import SwiftUI
import WebKit

struct WKView: UIViewRepresentable {
    @ObservedObject var webViewStateModel: WebView
    typealias UIVewType = WKWebView
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = WKWebView(frame: CGRect.zero)
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
