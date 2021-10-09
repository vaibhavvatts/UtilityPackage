//
//  File.swift
//  
//
//  Created by Vaibhav on 03/02/21.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
public struct ControlSnippetTitle: View {
    public var systemImgName: String
    public var title: String
    
    public init(systemImgName: String, title: String) {
        self.systemImgName = systemImgName
        self.title = title
    }
    
    public var body: some View {
        HStack {
            Image(systemName: systemImgName)
            Text(title)
            Spacer()
        }
        .font(.system(size: 17, weight: .semibold, design: .rounded))
        .foregroundColor(Color.white)
    }
}

@available(iOS 13, *)
public struct DotResultantView: View {
    public var title: String
    public var colorName: Color = .white
    
    public init(title: String, colorName: Color) {
        self.title = title
        self.colorName = colorName
    }
    
    public var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            DotView(colorName: colorName)
            
            SettingSnippetResultantText(title: self.title)
        }
    }
}

@available(iOS 13, *)
public struct SettingSnippetResultantText: View {
    public var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.system(size: 18, weight: .semibold, design: .rounded))
            .foregroundColor(Color.white)
    }
}

public struct DotView: View {
    public init(colorName: Color) {
        self.colorName = colorName
    }
    private var colorName: Color
    
    public var body: some View {
        Text(UtilConstants.dotMark)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(colorName)
    }
}

@available(iOS 13, *)
public struct IconTextLayoutSV: View {
    public var iconName: String
    public var text: String = ""
    public var isSelected = false
    
    public init(iconName: String, text: String = "", isSelected: Bool = false) {
        self.iconName = iconName
        self.text = text
        self.isSelected = isSelected
    }
    
    public var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(text)
        }
        .font(.system(size: 18, weight: .semibold, design: .rounded))
        .foregroundColor(isSelected ? Color.white : Color.white.opacity(0.6))
    }
}

public struct SettingSnippetInfoText: View {
    public var text: String
    
    public var body: some View {
        HStack {
            Text(text)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundColor(ColorNames.unSelected)
            Spacer()
        }
    }
}

public struct TileBottomButtonStyle: View {
    public var iconName: String
    public var text: String = ""
    public var isSelected = false
    
    public init(iconName: String, text: String = "", isSelected: Bool = false) {
        self.iconName = iconName
        self.text = text
        self.isSelected = isSelected
    }
    
    public var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(text)
                .padding(.leading, -4)
        }
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(isSelected ? Color.white : Color.white.opacity(0.7))
    }
}
