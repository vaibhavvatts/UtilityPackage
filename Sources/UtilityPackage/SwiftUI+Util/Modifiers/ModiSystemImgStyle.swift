//
//  ModiSystemImgStyle.swift
//  Optimum
//
//  Created by Vaibhav on 06/02/22.
//  Copyright © 2022 Vaibhav. All rights reserved.
//

import SwiftUI

public struct ModiSystemImgStyleIcon: ViewModifier {
    private var color: Color = ViewColor.viewWhite
    public init(color: Color) { self.color = color }
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundColor(color)
    }
}


public struct ModiNavImg1: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .foregroundColor(ViewColor.viewWhite)
    }
}
