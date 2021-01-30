//
//  UIViewController+Extension.swift
//  Utility
//
//  Created by Vaibhav on 20/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
     func showActionSheet(title: String?, message: String?, arrActionCategory: [ActionCategory]) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        func handlerForSheetAction(for category: ActionCategory) {
            let action = UIAlertAction(title: category.title, style: category.style, handler: { (action) in
                category.handler()
            })
            action.isEnabled = category.shouldEnable
            actionSheet.addAction(action)
        }
        for obj in arrActionCategory {
            handlerForSheetAction(for: obj)
        }
        return actionSheet
    }
    
    func showActionSheet(title: String, message: String, actionTitle: String, actionHandler: @escaping (()->())) -> UIAlertController {
        return showActionSheet(title: title, message: message, arrActionCategory: [ActionCategory(title: actionTitle, handler: {
            actionHandler()
        })])
    }
    
    func hideNavigationBar() { navigationController?.navigationBar.isHidden = true }
}
