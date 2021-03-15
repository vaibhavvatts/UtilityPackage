//
//  DBHelperViews.swift
//  Utility
//
//  Created by Vaibhav on 23/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import SwiftUI
import CoreData

@available(iOS 13, *)
public struct DynamicFetchView<T: NSManagedObject, Content: View>: View {
    let fetchRequest: FetchRequest<T>
    let content: (FetchedResults<T>) -> Content

    public var body: some View {
        self.content(fetchRequest.wrappedValue)
    }

    public init(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: predicate, animation: .easeInOut(duration: 0.4))
        self.content = content
    }

    public init(fetchRequest: NSFetchRequest<T>, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate?, fetchLimit: Int, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        fetchRequest.fetchLimit = fetchLimit
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        self.fetchRequest = FetchRequest<T>(fetchRequest: fetchRequest, animation: .easeInOut(duration: 0.3))
        self.content = content
    }
}
