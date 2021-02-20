//
//  WenView.swift
//  RestarantAppUsingZomatoApi
//
//  Created by Knoxpo MacBook Pro on 20/02/21.
//

import WebKit
import SwiftUI

struct WenView: UIViewRepresentable {
    var url = ""
    
    
    func makeUIView(context: UIViewRepresentableContext<WenView>) -> WKWebView {
        
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        
        return web
        
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WenView>) {
        
    }
    
    
    
    
    
}
