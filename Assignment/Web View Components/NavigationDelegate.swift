//
//  NavigationDelegate.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation
import WebKit

final class NavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let url = webView.url?.absoluteString {
            //inject custom javascript
            injectScripts(webView: webView, url: url)
        }
    }
    
    private func injectScripts(webView: WKWebView, url: String){
        if API.Product.Validate.productPage(url: url){
            //if this is the product page then inject the appropriate scripts
            webView.evaluateJavaScript(ScriptInjector.Product.detailPage, completionHandler: nil)
        }
    }
}
