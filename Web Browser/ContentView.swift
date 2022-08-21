//
//  ContentView.swift
//  Web Browser
//
//  Created by Vistrit Pandey on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var webView:WebView = WebView()
        @State private var webAddress = "https://neeva.com"
        var body: some View {
            VStack{
                HStack{
                    TextField("Enter Web Address",text: $webAddress)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(25)
                    Button(action: {
                        webView.pageTitle = webAddress
                        webView.goToPage = true
                    }, label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                    })
                    .font(.title)
                }
                WKView(webView: webView)
                
            }
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.bottomBar){
                    HStack{
                        Button(action: {
                            webView.goBack = true
                        }, label: {
                            Image(systemName: "arrow.backward")
                        })
                        Button(action: {
                            webView.goForward = true
                        }, label: {
                            Image(systemName: "arrow.forward")
                        })
                    }
                }
            }
        }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
