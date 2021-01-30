//
//  UILabel+Extension.swift
//  Utility
//
//  Created by Vaibhav on 04/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
    
    /// To apply gradient on UILabel text
    /// - Parameter colors: array of gradient colors effective from left to right (or language type)
    func textGradient(colors: [CGColor]) {
        
        let rect = self.frame
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return }
        textColor =  UIColor(patternImage: image)
    }
}
