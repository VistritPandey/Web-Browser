//
//  WebView.swift
//  Web Browser
//
//  Created by Vistrit Pandey on 8/21/22.
//

import Foundation

class WebView: ObservableObject {
    @Published var pageTitle: String = "https://neeva.com"
    @Published var goToPage: Bool = false
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
}
