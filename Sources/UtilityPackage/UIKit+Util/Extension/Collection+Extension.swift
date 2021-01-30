//
//  Collection+Extension.swift
//  Utility
//
//  Created by Vaibhav on 14/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// enumerate an array stating from 0th index.
    /// - Parameter closure: returns obj with index and halt control.
    func enumerate(_ closure: (Element, Int, inout Bool) -> Void) {
        var stop = false
        for (index, value) in self.enumerated() {
            if stop { break }
            closure(value, index, &stop)
        }
    }
}
