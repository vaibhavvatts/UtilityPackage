//
//  ImageAccess.swift
//  Utility
//
//  Created by Vaibhav on 20/12/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit

#if !os(watchOS)
public protocol ImageAccessDelegate {
    func didSelectImage(image: UIImage?)
    func didNotSelectImage()
}

public class ImageAccess: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public init(delegate: ImageAccessDelegate? = nil, delegateViewController: UIViewController? = nil, title: String = "", subTitle: String = "") {
        self.delegate = delegate
        self.delegateViewController = delegateViewController
        self.title = title
        self.subTitle = subTitle
    }
    
    private var delegate: ImageAccessDelegate?
    private var delegateViewController: UIViewController?
    private let title: String
    private let subTitle: String
    
    public func askToOpenCameraOrGallerySheet() {
        if delegateViewController == nil { delegateViewController = UtilityUIKit.topViewController }
        
        var actionCategory = [ActionCategory]()
        actionCategory.append(ActionCategory(title: "Open Camera", style: .default, handler: { [unowned self] in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            imagePicker.cameraCaptureMode = .photo
            imagePicker.cameraDevice = .rear
            imagePicker.modalPresentationStyle = .overFullScreen
            self.delegateViewController?.present(imagePicker, animated: true, completion: nil)
        }))
        actionCategory.append(ActionCategory(title: "Open Gallery", style: .default, handler: { [unowned self] in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.modalPresentationStyle = .overFullScreen
            imagePicker.navigationBar.barTintColor = UtilityUIKit.topViewController?.navigationController?.navigationBar.barTintColor
            imagePicker.navigationBar.tintColor = UIColor.darkGray
            self.delegateViewController?.navigationController?.navigationBar.isHidden = false
            imagePicker.navigationBar.titleTextAttributes = [NSAttributedString.Key.strokeColor: ColorNameUIKit.viewWhite, NSAttributedString.Key.foregroundColor: ColorNameUIKit.viewWhite]
            self.delegateViewController?.present(imagePicker, animated: true, completion: nil)
        }))
        actionCategory.append(ActionCategory(title: "Cancel", style: .cancel, handler: {
            
        }))
        if let alertController = delegateViewController?.showActionSheet(title: self.title, message: self.subTitle, arrActionCategory: actionCategory) {
            alertController.popoverPresentationController?.sourceView = UtilityUIKit.topViewController?.view
            if let delegateViewController = delegateViewController {
                alertController.popoverPresentationController?.sourceRect = CGRect(x: delegateViewController.view.centerX, y: delegateViewController.view.centerY, width: 0, height: 0)
            }
            alertController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            delegateViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.delegate?.didSelectImage(image: image)
        UtilityUIKit.topViewController?.dismiss(animated: true, completion:nil)
        UtilityUIKit.topViewController?.navigationController?.navigationBar.isHidden = true
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.delegate?.didNotSelectImage()
        UtilityUIKit.topViewController?.dismiss(animated: true, completion:nil)
    }
}
#endif
