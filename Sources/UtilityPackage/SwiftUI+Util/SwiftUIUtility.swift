//
//  SwiftUIUtility.swift
//  Utility
//
//  Created by Vaibhav on 22/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13, *)
open class SwiftUIUtility {
    public class func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
}
