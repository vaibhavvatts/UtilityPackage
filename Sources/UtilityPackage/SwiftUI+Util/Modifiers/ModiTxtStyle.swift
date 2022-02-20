//
//  ModiTxtStyle.swift
//  Optimum
//
//  Created by Vaibhav on 06/02/22.
//  Copyright © 2022 Vaibhav. All rights reserved.
//

import SwiftUI

public enum EnumTxtStyle: Int {
    case largeHeading, heading, titleRegular, titleMedium, titleBold, titleBoldDim, titleDim, footNote, tag
    
    public var value: (size: CGFloat, weight: Font.Weight, color: Color) {
        switch self {
        case .largeHeading:
            return (24, .medium, ViewColor.viewWhite)
        case .heading:
            return (20, .medium, ViewColor.viewWhite)
        case .titleRegular:
            return (16, .regular, ViewColor.viewWhite)
        case .titleMedium:
            return (16, .medium, ViewColor.viewWhite)
        case .titleBold:
            return (16, .bold, ViewColor.viewWhite)
        case .titleDim:
            return (16, .regular, ViewColor.dimFootnote)
        case .titleBoldDim:
            return (16, .medium, ViewColor.dimFootnote)
        case .footNote:
            return (14, .medium, ViewColor.dimFootnote)
        case .tag:
            return (11, .thin, ViewColor.viewWhite)
        }
    }
}

public struct ModiTxtStyle: ViewModifier {
    private let style: EnumTxtStyle
    public init(_ style: EnumTxtStyle) {
        self.style = style
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: style.value.size, weight: style.value.weight, design: .rounded))
            .foregroundColor(style.value.color)
    }
}
