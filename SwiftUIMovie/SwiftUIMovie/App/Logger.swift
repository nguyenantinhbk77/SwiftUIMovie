//
//  Logger.swift
//  SwiftUIMovie
//
//  Created by Tinh Nguyen on 18/5/24.
//

import Foundation

final class Logger {
    static func log(_ text: String) {
        #if DEBUG
        print (text)
        #endif
    }
    
    static func log(_ objects: Any...) {
        #if DEBUG
        objects.forEach({ print($0)})
        #endif
    }
}
