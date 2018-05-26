//
///  ViewController.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/18/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var webView: ProductWebView!
    @IBOutlet weak var nextButton:UIButton!
    @IBOutlet weak var backButton:UIButton!
    
    let navigationDelegate = NavigationDelegate()
    let scriptHandler = ScriptMessageHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scriptHandler.delegate = self
        webView.configure(nav: navigationDelegate, script: scriptHandler, homeURL: API.Product.mensHomePage)
    }
}

extension ViewController: JavascriptHandlerDelegate {
    
    func received(product: Product) {
        let alertController = UIAlertController (title: "Enter Payment Information", message: "Credit Card Number", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let purchase = UIAlertAction(title: "Purchase", style: .default) { _ in
            self.completePurchase(with: product)
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(purchase)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func completePurchase(with: Product){
        guard let orderPage = Page.Product.order else { return }
        
        // TODO: find a way to do templating to insert data
        // "parsing"
        webView.loadHTMLString(orderPage
            .replacingOccurrences(of: "{name}", with: with.name)
            .replacingOccurrences(of: "{price}", with: with.price)
            .replacingOccurrences(of: "{image}", with: with.image)
            , baseURL: nil)
    }
}


