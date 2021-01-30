//
//  Int+.swift
//  Utility
//
//  Created by Vaibhav on 19/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation

public extension Int {
    var ordinal: String? {
        return ordinalFormatter.string(from: NSNumber(value: self))
    }
    
    var leadingZero: String? {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        return formatter.string(from: NSNumber(value: self))
    }
    
    private var ordinalFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter
    }
}
