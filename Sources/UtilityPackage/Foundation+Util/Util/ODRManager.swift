//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 30/09/21.
//

import Foundation

public enum ThemeFetchError :Error {
    case notFound
}

public class ODRManager: NSObject {

    public var currentRequest: NSBundleResourceRequest?
    private var progressObservingContext: UnsafeMutableRawPointer? = nil
    override init() { }


    public func loadAsset(withTag tag: String, completion: @escaping (Error?)->()) {
        var tagSet = Set<String>()
        tagSet.insert(tag)

        currentRequest = NSBundleResourceRequest(tags: tagSet)
        guard let request = currentRequest else {
            completion(ThemeFetchError.notFound)
            return
        }

        request.conditionallyBeginAccessingResources { (isAvailable) in
            if isAvailable {
                completion(nil)
            } else {
                request.progress.addObserver(self, forKeyPath: "fractionCompleted", options: .new, context: self.progressObservingContext)

                request.beginAccessingResources { (error) in
                    DispatchQueue.main.async {
                        if let err = error {
//                            print(err.localizedDescription)
                            completion(err)
                        } else {
                            request.progress.removeObserver(self, forKeyPath: "fractionCompleted")
//                            SVProgressHUD.dismiss()
                            completion(nil)
                        }
                    }
                }

            }
        }
    }

    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == progressObservingContext && keyPath == "fractionCompleted" {
            if let progress = object as? Progress {

                DispatchQueue.main.async {
                    print(progress.fractionCompleted)
                }
            }

        }

    }

}
