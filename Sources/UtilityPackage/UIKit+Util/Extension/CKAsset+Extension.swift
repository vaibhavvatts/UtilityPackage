//
//  CKAsset+Extension.swift
//  Utility
//
//  Created by Vaibhav on 12/09/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

public extension CKAsset {
    func toUIImage() -> UIImage? {
        guard let data = toData() else { return nil }
        return UIImage(data: data)
    }
    
    func toData() -> Data? {
        guard let file = self.fileURL else { return nil }
        let data = try? Data(contentsOf: file)
        return data
    }
}
