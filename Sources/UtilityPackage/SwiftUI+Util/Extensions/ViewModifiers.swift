//
//  ViewModifiers.swift
//  Utility
//
//  Created by Vaibhav on 20/10/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import SwiftUI

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

public struct NavBtnImgModifier: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundColor(ThemeColors.activeThemeColor)
    }
}

public struct NavBtnTxtModifier: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .foregroundColor(ThemeColors.activeThemeColor)
    }
}

public struct ModifierIndividualBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(2*UtilConstants.Spacing.intrimPadding)
            .background(ViewColor.gray1)
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(ViewColor.viewWhite.opacity(0.06), lineWidth: 1)
            )
    }
}

public struct ModifierSnippetBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(UtilConstants.Spacing.interiorMargin)
            .background(ViewColor.gray1)
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(ViewColor.viewWhite.opacity(0.06), lineWidth: 1)
            )
    }
}
//FIX : 2*UtilConstants.Spacing.intrimPadding
public struct ModifierSnippetChildBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .semibold, design: .rounded))
            .padding(2*UtilConstants.Spacing.intrimPadding)
            .background(ViewColor.gray2.opacity(0.2))
            .cornerRadius(7)
            .shadow(color: ViewColor.viewWhite.opacity(0.2), radius: 1)
    }
}

public struct HorizontalScrollElementModifier: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(8)
            .foregroundColor(ViewColor.viewWhite)
            .background(ViewColor.gray2.opacity(0.2))
            .cornerRadius(7)
            .shadow(color: ViewColor.viewWhite.opacity(0.2), radius: 1)
    }
}
