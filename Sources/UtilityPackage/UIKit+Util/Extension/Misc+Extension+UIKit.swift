//
//  Misc+Extension+UIKit.swift
//  Utility
//
//  Created by Vaibhav on 11/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

public extension CGPoint {
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint { CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y) }
}

public extension UITextView {
    /// Veritcally centers the text inside text view.
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(0, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}

public extension NSMutableAttributedString {
    /// set UIFont on MutableAtributed String
    /// - Parameters:
    ///   - font: font to be set
    ///   - range: NSRange descriptio
    /// - Returns: MutableAtributed
    @discardableResult
    func setFont(_ font: UIFont, range: NSRange? = nil)-> NSMutableAttributedString {
        let range = range ?? NSMakeRange(0, self.length)
        self.addAttributes([.font: font], range: range)
        return self
    }
}


