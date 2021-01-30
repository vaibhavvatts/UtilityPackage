//
//  Color+Extension.swift
//  Utility
//
//  Created by Vaibhav on 21/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    /// Hexadecimal color code UIColor convertor
    /// - Parameters:
    ///   - hex: hex value
    ///   - alpha: alpha component
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
