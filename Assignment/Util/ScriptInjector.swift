//
//  ScriptInjector.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation

/// Used to inject custom scripts into mobile web pages
/// TODO: move this to an actual javascript file!
struct ScriptInjector {

    /// Product Scripts
    struct Product {
        
        /// Script for the Product Detail Page
        static let detailPage = View.payButton + Function.payButton
        
        /// View Manipulations
        private struct View {
            
            /// Pay Button Manipulation
            static let payButton = "document.getElementById('mainContent').getElementsByClassName('btn primary full-width add-to-cart-btn')[0].innerText='Pay';"
        }
        
        /// Logic Functions
        private struct Function {
            
            /// When the pay button is pressed, pass product information to the iOS app
            static let payButton = ("""
                        document.getElementById('mainContent').getElementsByClassName('btn primary full-width add-to-cart-btn')[0].addEventListener("click", function(){
                    
                            var data = {'name': document.getElementsByClassName('product-header')[0].innerText, 'price': document.getElementsByClassName('product-price')[0].innerText, 'image': document.getElementsByClassName('product-image')[0].src };
                            try {
                                webkit.messageHandlers.ScriptMessageHandler.postMessage(data);
                            } catch(err) {
                            console.log('error');
                            }
                        });
                    """)
        }
        
    }
}
