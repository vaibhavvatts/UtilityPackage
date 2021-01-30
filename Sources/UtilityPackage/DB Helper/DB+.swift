//
//  DB+.swift
//  Utility
//
//  Created by Vaibhav on 03/01/21.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import CoreData

public extension NSManagedObject {
    func addObject(value: NSManagedObject, forKey key: String) {
        let items = self.mutableSetValue(forKey: key)
        items.add(value)
    }
    func removeObject(value: NSManagedObject, forKey key: String) {
        let items = self.mutableSetValue(forKey: key)
        items.remove(value)
    }
}


// hello
