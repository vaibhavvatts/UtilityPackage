//
//  DBUtility.swift
//  Utility
//
//  Created by Vaibhav on 12/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import CoreData

open class DBUtility {
    public class func saveContext(_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
