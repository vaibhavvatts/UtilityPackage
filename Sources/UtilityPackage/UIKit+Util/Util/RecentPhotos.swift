//
//  LibraryPhoto.swift
//  Utility
//
//  Created by Vaibhav on 07/01/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import UIKit
import Photos

@available(iOS 13, *)
public struct RecentPhotos {
    private static var size:CGSize = .zero
    private static var arrImgs = [UIImage]()
    
    public static func fetchPhotos(with targetSize: CGSize, count: Int, completionHandler: @escaping ([UIImage])->()) {
        checkPhotoLibraryPermission { status in
            guard status == .authorized else { return }
            
            size = targetSize
            arrImgs.removeAll()
            // Sort the images by descending creation date and fetch the first 3
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
            fetchOptions.fetchLimit = count

            // Fetch the image assets
            let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)

            // If the fetch result isn't empty,
            // proceed with the image request
            if fetchResult.count > 0 {
                fetchPhotoAtIndex(0, count, fetchResult)
            }
            
            completionHandler(arrImgs)
        }
        
        
    }
    
    public static func checkPhotoLibraryPermission(completionStatus: @escaping (PHAuthorizationStatus)->()) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completionStatus(.authorized)
        case .denied, .restricted :
            UtilityUIKit.openSettings(title: "Allow Access to Photos", message: "Allow access to photos")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    completionStatus(.authorized)
                case .denied, .restricted:
                    UtilityUIKit.openSettings(title: "Allow Access to Photos", message: "Allow access to photos")
                default: completionStatus(.denied)
                }
                
            }
        default: completionStatus(.denied)
        }
    }
    
    // Repeatedly call the following method while incrementing
    // the index until all the photos are fetched
    private static func fetchPhotoAtIndex(_ index:Int, _ totalImageCountNeeded: Int, _ fetchResult: PHFetchResult<PHAsset>) {

        // Note that if the request is not set to synchronous
        // the requestImageForAsset will return both the image
        // and thumbnail; by setting synchronous to true it
        // will return just the thumbnail
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true

        // Perform the image request
        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: size, contentMode: PHImageContentMode.aspectFill, options: requestOptions, resultHandler: { (image, _) in
            if let image = image {
                // Add the returned image to your array
                arrImgs.append(image)
            }
            // If you haven't already reached the first
            // index of the fetch result and if you haven't
            // already stored all of the images you need,
            // perform the fetch request again with an
            // incremented index
            
            
            // TODO: what if total no. of images are less than what is asked for.
            if index + 1 < fetchResult.count && arrImgs.count < totalImageCountNeeded {
                self.fetchPhotoAtIndex(index + 1, totalImageCountNeeded, fetchResult)
            } else {
                // Else you have completed creating your array
//                self.viewAssetCollection.reloadData()
            }
        })
    }
}
