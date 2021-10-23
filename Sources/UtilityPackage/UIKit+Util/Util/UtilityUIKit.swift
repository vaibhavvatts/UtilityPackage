//
//  Utility.swift
//  Utility
//
//  Created by Vaibhav on 21/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics
import CoreText

#if !os(watchOS)
open class UtilityUIKit {
    public static var rootViewController: UIViewController? {
        for scene in UIApplication.shared.connectedScenes {
            if scene.activationState == .foregroundActive,
               let rootVc = (((scene as? UIWindowScene)?.delegate as? UIWindowSceneDelegate)?.window as? UIWindow)?.rootViewController {
                return rootVc
            }
        }
        return nil
    }
    
  
    public static func pushOnTopNav(to viewController: UIViewController) {
        if let topVc = topViewController {
            topVc.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    public static func present(viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .overFullScreen, navBarHidden: Bool = false) {
        if let rootVc = rootViewController {
            let navController = UINavigationController(rootViewController: viewController)
            navController.modalPresentationStyle = presentationStyle
            navController.navigationBar.isHidden = navBarHidden
            rootVc.present(navController, animated: true, completion: nil)
        }
    }
    
    public static var topViewController: UIViewController? {
        guard let rootController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController else { return nil }
        
        if let rootVC = rootController as? UINavigationController {
            return rootVC.visibleViewController
        }
        else if let rootVc = rootController as? UISplitViewController {
            guard let navigationController = rootVc.viewControllers.last as? UINavigationController else { return nil }
            return navigationController.topViewController
        }
        return nil
    }
    
    public static var topVC: UIViewController? {
        guard let rootController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController else { return nil }
        
        if let rootVC = rootController as? UINavigationController {
            return rootVC.visibleViewController
        }
        else if let rootVc = rootController as? UISplitViewController {
            guard let navigationController = rootVc.viewControllers.first as? UINavigationController else { return nil }
            return navigationController.topViewController
        }
        return nil
    }
    
    public static func registerFont(with data: Data?) -> String? {
        guard let data = data, let dataProvider = CGDataProvider(data: data as CFData) else { return nil }
        guard let cgFont = CGFont(dataProvider) else { return nil }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(cgFont, &error) { print("Error loading Font!") }
        else {
            let fontName = cgFont.postScriptName
            //            let font = UIFont(name: String(fontName!) , size: 30)
            return fontName as String?
        }
        return nil
    }
    
    public static func kerning(by value: CGFloat, for str: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
    
    public static func lineSpacing(by value: CGFloat, for str: String) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: str)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24 // change line spacing between paragraph like 36 or 48
        style.minimumLineHeight = 20 // change line spacing between each line like 30 or 40
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: str.count))
        return attrString
    }
    
    public class func addAlertController(onViewController controller:UIViewController,messageString message:String, title: String?, firstTitle: String, tintColor: UIColor? = .red, okHandler ok:(()->Void)?,cancelHandler cancel:(()->Void)?) {
        weak var cont = controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let okHandler = ok {
            alertController.addAction(UIAlertAction(title: firstTitle, style: .default, handler: { (action) in
                okHandler()
            }))
        }
        if let cancelHandler = cancel {
            alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
                cancelHandler()
            }))
        }
        alertController.view.tintColor = tintColor
        cont?.present(alertController, animated: true, completion: nil)
    }
    
    public static func openSettings(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler:nil)
                }
            }
            alertController.addAction(settingsAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            UtilityUIKit.topViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    public class var isIpad: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad { return true }
        return false
    }
    
    public class var isIphone: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone { return true }
        return false
    }
}

#endif
