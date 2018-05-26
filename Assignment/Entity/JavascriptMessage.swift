//
//  JavascriptMessage.swift
//  Assignment
//
//  Created by Carl Brenneisen on 1/19/17.
//  Copyright © 2018 Carl Brenneisen. All rights reserved.
//

import Foundation

struct JavascriptMessage: Codable {
    let identifier: String
    let data: [String:String]
}
