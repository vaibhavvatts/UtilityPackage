//
//  ModiBoxStyle.swift
//  Optimum
//
//  Created by Vaibhav on 06/02/22.
//  Copyright © 2022 Vaibhav. All rights reserved.
//

import SwiftUI

public struct ModiBoxStyleSnippet2: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(UtilConstants.Spacing.snippetPadding)
            .background(ViewColor.snippet1)
            .cornerRadius(8)
    }
}

public struct ModiBoxStyleSnippet3: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(UtilConstants.Spacing.snippetPadding)
            .background(ViewColor.dimFootnote)
            .cornerRadius(8)
    }
}


public struct ModiBoxStyleIcon: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(2*UtilConstants.Spacing.intrimPadding)
            .background(ViewColor.gray2)
            .cornerRadius(7)
            .shadow(color: ViewColor.viewWhite.opacity(0.2), radius: 1)
    }
}


public struct ModiBoxStyleSnippet1: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(3*UtilConstants.Spacing.intermittentPadding)
            .background(ViewColor.snippet1)
            .cornerRadius(8)
    }
}

public struct ModiTagStyle: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .padding(UtilConstants.Spacing.intrimPadding)
            .background(ViewColor.gray2)
            .cornerRadius(7)
    }
}
