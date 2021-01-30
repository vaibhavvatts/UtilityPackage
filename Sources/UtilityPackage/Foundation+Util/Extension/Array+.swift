//
//  Array+.swift
//  Utility
//
//  Created by Vaibhav on 20/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation


extension Array {
    func enumerate(_ closure: (Element, Int, inout Bool) -> ()) {
        var stop = false
        for (index, value) in self.enumerated() {
            if stop { break }
            closure(value, index, &stop)
        }
    }
    
    func reverseEnumerate(_ closure: (Element, Int, inout Bool) -> ()) {
        var stop = false
        for (index, value) in self.enumerated().reversed() {
            if stop { break }
            closure(value, index, &stop)
        }
    }
}
