//
//  ToolbarOptionsLayout.swift
//  MiniNotes (iOS)
//
//  Created by Vaibhav kumar on 12/8/21.
//

import SwiftUI

public struct ToolbarOptionsLayout: View {
    private var iconName: String
    private var text: String = ""
    private var isSelected = false
    private var selectionColor: Color
    
    public init(iconName: String, text: String = "", isSelected: Bool = false, selectionColor: Color = .white) {
        self.iconName = iconName
        self.text = text
        self.isSelected = isSelected
        self.selectionColor = selectionColor
    }
    
    public var body: some View {
        HStack(alignment: .firstTextBaseline) {
            if !iconName.isEmpty {
                Image(systemName: iconName)
                    .font(.system(size: 13, weight: .bold, design: .rounded))
            }
            if !text.isEmpty {
                Text(text)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .padding(.leading, iconName.isEmpty ? 0 : -4)
            }
        }
        .foregroundColor(isSelected ? selectionColor : .white)
    }
}
