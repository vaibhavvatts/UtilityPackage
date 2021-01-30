//
//  Util+SwiftUI.swift
//  Utility
//
//  Created by Vaibhav on 10/01/21.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
open class UtilSwiftUI {
    public static func makeGradient(colors: [Color]) -> some View {
        LinearGradient(
            gradient: .init(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
