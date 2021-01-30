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
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: predicate, animation: .easeOut(duration: 1))
        self.content = content
    }

    public init(fetchRequest: NSFetchRequest<T>, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        self.fetchRequest = FetchRequest<T>(fetchRequest: fetchRequest)
        self.content = content
    }
}
