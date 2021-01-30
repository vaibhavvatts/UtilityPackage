//
//  ViewModifiers.swift
//  Utility
//
//  Created by Vaibhav on 20/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
public extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler()
        })
    }
}
