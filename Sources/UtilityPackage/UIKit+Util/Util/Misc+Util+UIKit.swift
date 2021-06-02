//
//  Misc+Util+UIKit.swift
//  Utility
//
//  Created by Vaibhav on 14/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

#if !os(watchOS)
open class ActionCategory {
    let title: String
    let handler: ()->()
    let style: UIAlertAction.Style
    let shouldEnable: Bool
    
    /// Action category is the type of action demanded
    /// - Parameters:
    ///   - title: action title
    ///   - style: default(primary) or destructive
    ///   - shouldEnable: bool to indicate enable or diable
    ///   - handler: return closure
    /// - Returns: nil
    init(title: String, style: UIAlertAction.Style = .default, shouldEnable: Bool = true, handler: @escaping ()->()) {
        self.title = title
        self.handler = handler
        self.style = style
        self.shouldEnable = shouldEnable
    }
}
#endif
