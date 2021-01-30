//
//  UIView+Extension.swift
//  Utility
//
//  Created by Vaibhav on 10/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//
import UIKit

public extension UIView {
    
    /// Load nib/xib for any UIView.
    /// - Returns: reference to the allocated class
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else { return nil }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fillSuperview()
        return contentView
    }

    var origin: CGPoint {
        return self.frame.origin
    }
    
    var size: CGSize {
        return self.bounds.size
    }
    
    var width: CGFloat {
        return self.bounds.width
    }
    
    var height: CGFloat {
        return self.bounds.height
    }
    
    var centerX: CGFloat {
        return self.center.x
    }
    
    var centerY: CGFloat {
        return self.center.y
    }
    
    var X: CGFloat {
        return self.frame.origin.x
    }
    
    var Y: CGFloat {
        return self.frame.origin.y
    }
    
    var extremeX: CGFloat {
        return self.frame.origin.x + width
    }
    
    var extremeY: CGFloat {
        return self.frame.origin.y + height
    }
    
    var trailingRect: CGRect {
        return CGRect(x: self.X, y: self.Y, width: self.width, height: self.height + 5)
    }
}
