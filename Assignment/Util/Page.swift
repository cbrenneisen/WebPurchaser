//
//  Page.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation

//Convience File for Reading Local Pages
struct Page {
    
    //MARK: - File Reading
    private struct File {
        
        /// Get the file path for an HTML page
        /// parameters -
        ///     filename: the name of the file to get the path for
        /// return
        ///     string: the complete file path (nil if the file does not exist)
        private static func getPath(filename: String) -> String? {
            return Bundle.main.path(forResource: filename, ofType: "html")
        }
    
        /// Get the contents of a given HTML file
        /// parameters -
        ///     filename: the name of the file to get the content for
        /// return -
        ///     string: the complete contents of the file (nil if the file does not exist)
        static func getContents(filename: String) -> String? {
            guard let path = getPath(filename: filename) else { return nil }

            do { return try String(contentsOfFile: path) }
            catch let e as NSError {
                print(e.localizedDescription)
                return nil
            }
        }
    }
    
    //MARK: - Page Categories
    
    //MARK: Product Pages
    struct Product{
        
        //Order Page
        static var order: String? {
            return File.getContents(filename: "YourOrder")
        }
    }
}
