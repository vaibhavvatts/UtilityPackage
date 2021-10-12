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

public struct NavBtnModifier: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 19, weight: .semibold, design: .rounded))
            .foregroundColor(ColorNames.theme)
    }
}

public struct ModifierIndividualBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(8)
            .background(ColorNames.snippetBackground)
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
    }
}

public struct ModifierSnippetBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(10)
            .background(ColorNames.snippetBackground)
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
    }
}

public struct ModifierSnippetChildBackground: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .semibold, design: .rounded))
            .padding(8)
            .foregroundColor(ColorNames.warningColor)
            .background(ColorNames.unSelectedBg.opacity(0.2))
            .cornerRadius(7)
            .shadow(color: Color.white.opacity(0.2), radius: 1)
    }
}
