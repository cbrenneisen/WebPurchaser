//
//  ProductWebView.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import UIKit
import WebKit

final class ProductWebView: WKWebView {
    
    func configure(nav: WKNavigationDelegate, script: JavascriptHandler, homeURL: String){
     
        //assign delegates
        navigationDelegate = nav
        configuration.userContentController.add(script, name: script.identifier)
        
        //load url
        if let url = URL(string: homeURL){
            load(URLRequest(url: url))
        }
    }
}
