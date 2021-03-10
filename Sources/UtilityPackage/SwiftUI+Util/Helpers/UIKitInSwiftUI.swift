//
//  UIKitInSwiftUI.swift
//  JotDown
//
//  Created by Vaibhav on 06/02/21.
//  Copyright © 2021 Vaibhav. All rights reserved.
//

import SwiftUI
import UIKit

#if canImport(UIKit)
@available(iOS 13, *)
public extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
