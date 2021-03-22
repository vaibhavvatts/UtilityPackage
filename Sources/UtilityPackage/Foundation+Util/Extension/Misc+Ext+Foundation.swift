//
//  Misc+Ext+Foundation.swift
//  Utility
//
//  Created by Vaibhav on 17/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation


public extension Collection {
    func isNotEmpty() -> Bool {
        return !self.isEmpty
    }
}

extension String {
    public func toBool() -> Bool {
        var bool : Bool?
        switch self.lowercased() {
        case "true", "t", "yes", "y", "1":
            bool = true
        case "false", "f", "no", "n", "0":
            bool = false
        default:
            bool = nil
        }
        guard let boolUn = bool else { return false }
        return boolUn
    }
}
