//
//  API.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation

/// File for structuring URLs
struct API {
    
    /// base domains
    private struct Domain {
        static let mobileWebsite = "https://m.levi.com"
    }
    
    /// what locale to use
    /// default: United States / English
    private struct Locale {
        static let us = "US/en_US"
    }
    
    /// Base path to use for all URLS
    private struct Base {
        static let web = Domain.mobileWebsite + "/" + Locale.us
    }
    
    /// Product URLS
    struct Product {
        
        /// URL for the Men's Home Page - shows all of the default Men's products
        static let mensHomePage = API.Base.web + "/categories/category~men~jeans~all/products"
     
        /// Validates whether URLS are a certain type
        struct Validate {
            
            /// determines whether a given url is a product detail page
            /// parameters -
            ///     url: the url of the page to check
            /// return -
            ///     bool: whether this is a product page or not
            static func productPage(url: String) -> Bool {
                let regex = "^" + API.Base.web + "/products/" + "\\d+"
                return match(regex: regex, url: url)
            }
        }
    }
    
    // REGEX Helper function
    /// parameters -
    ///     regex: format to match
    ///     url: the url to analyze
    /// return -
    //      bool: true if the url matches the format, false other wise
    private static func match(regex: String, url: String) -> Bool {
        let predicate = NSPredicate(format: "self MATCHES [c] %@", regex)
        let result = predicate.evaluate(with: url)
        return result
    }
}



