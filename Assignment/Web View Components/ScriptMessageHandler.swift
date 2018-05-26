//
//  ScriptMessageHandler.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation
import WebKit

protocol JavascriptHandler: WKScriptMessageHandler {
    var identifier: String { get }
}

protocol JavascriptHandlerDelegate: class {
    
    func received(product: Product)
}

final class ScriptMessageHandler: NSObject, JavascriptHandler {
    
    let identifier = "ScriptMessageHandler"
    
    weak var delegate: JavascriptHandlerDelegate?
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        do{
            let data = try JSONSerialization.data(withJSONObject: message.body, options: .sortedKeys)
            let product = try JSONDecoder().decode(Product.self, from: data)
            delegate?.received(product: product)
        }catch {
            //TODO: handle error
        }
    }
}
