//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 11/27/21.
//

import Foundation
import UIKit

public class ShareAppContent {
    public static func shareAppContent(for arrContent: [Any]) {
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: arrContent, applicationActivities: nil)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityViewController.popoverPresentationController?.sourceView = UtilityUIKit.topViewController?.view
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 50, y: 50, width: 300, height: 350)
            activityViewController.popoverPresentationController?.permittedArrowDirections = [.left]
        }
        
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message
        ] as? UIActivityItemsConfigurationReading
        
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        
        activityViewController.isModalInPresentation = true
        UtilityUIKit.topViewController?.present(activityViewController, animated: true, completion: nil)
    }
}
