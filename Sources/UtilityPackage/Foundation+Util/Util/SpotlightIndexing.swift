//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 11/26/21.
//

import Foundation
import CoreSpotlight

public class SpotlightIndexing {
    public class func spotlightIndex(id: String?, txtContent: String) {
        guard !txtContent.isEmpty else { return }
        guard let id = id else {
            return
        }

        if #available(iOS 15, *) {
            let attributeSet = CSSearchableItemAttributeSet(contentType: .text)
            attributeSet.title = txtContent
            attributeSet.contentDescription = txtContent
            
            let item = CSSearchableItem(uniqueIdentifier: id, domainIdentifier: "com.vaibhav.apps", attributeSet: attributeSet)
            CSSearchableIndex.default().indexSearchableItems([item]) { error in
                if let error = error {
                    //                print("Indexing error: \(error.localizedDescription)")
                } else {
                    //                print("Search item successfully indexed!")
                }
            }
        }
    }
    
    public class func deIndexItem(identifier: String? ) {
        guard let identifier = identifier else {
            return
        }
        if #available(iOS 15, *) {
            CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["\(identifier)"]) { error in
                if let error = error {
                    //                print("Deindexing error: \(error.localizedDescription)")
                } else {
                    //                print("Search item successfully removed!")
                }
            }
        }
    }
}
