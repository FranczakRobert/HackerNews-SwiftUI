//
//  WebView.swift
//  HackerNews
//
//  Created by Robert Franczak on 10/04/2023.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrlString = urlString {
            if let safeUrl = URL(string: safeUrlString) {
                let request = URLRequest(url: safeUrl)
                DispatchQueue.main.async {
                    uiView.load(request)
                }
            }
        }
    }
}
