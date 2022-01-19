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
        .foregroundColor(ViewColor.viewWhite)
    }
}

@available(iOS 13, *)
public struct DotResultantView: View {
    public var title: String
    public var colorName: Color = ViewColor.viewWhite
    
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
            .foregroundColor(ViewColor.viewWhite)
    }
}

@available(iOS 13, *)
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
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(isSelected ? ViewColor.viewWhite : ViewColor.viewWhite.opacity(0.6))
    }
}

struct SettingSnippetInfoText: View {
    var text: String
    
    var body: some View {
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
        .foregroundColor(isSelected ? ViewColor.viewWhite : ViewColor.viewWhite.opacity(0.7))
    }
}

public struct HorizontalScrollSnippetControlView<T: HorizontalScrollControlSnippetProtocol, Content>: View where Content : View {
    public init(arrData: [T], closureSelecedObj: @escaping (T) -> (), content: @escaping (T) -> Content) {
        self.arrData = arrData
        self.closureSelecedObj = closureSelecedObj
        self.content = content
    }
    
    public var arrData: [T]
    public var closureSelecedObj: (T)->()
    public var content: (T) -> Content
    
    
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.arrData, id: \.self) { obj in
                    Button(action: {
                        self.closureSelecedObj(obj)
                        HapticEngine.generateSoftHaptic()
                    }) {
                        self.content(obj)
                            .modifier(ModifierSnippetChildBackground())
                    }
                }
            }
        }
    }
}



public struct RingSnippetControlView<T: HorizontalScrollControlSnippetProtocol, Content>: View where Content : View {
    public init(arrData: [T], closureSelecedObj: @escaping (T) -> (), content: @escaping (T) -> Content) {
        self.arrData = arrData
        self.closureSelecedObj = closureSelecedObj
        self.content = content
    }
    
    public var arrData: [T]
    public var closureSelecedObj: (T)->()
    public var content: (T) -> Content
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.arrData, id: \.self) { obj in
                    Button(action: {
                        self.closureSelecedObj(obj)
                        HapticEngine.generateSoftHaptic()
                    }) {
                        self.content(obj)
                    }
                }
            }
        }
    }
}


public struct SettingSnippetItemText: View {
    public init(title: String, fontName: String? = nil, isSelected: Bool = false) {
        self.title = title
        self.fontName = fontName
        self.isSelected = isSelected
    }
    
    private var title: String
    private var fontName: String?
    private var isSelected = false
    
    public var body: some View {
        Text(title)
            .font(fontName == nil ? .system(size: 16, weight: .semibold, design: .rounded) : .custom(fontName ?? "", size: 17))
            .foregroundColor(isSelected ? ViewColor.viewWhite : Color.gray.opacity(0.9))
    }
}

public struct ImageSnippetItem: View {
    public init(imgName: Image, isSelected: Bool = false) {
        self.imgName = imgName
        self.isSelected = isSelected
    }
    
    private var imgName: Image
    private var isSelected = false
    
    public var body: some View {
        imgName
            .font(.system(size: 17, weight: .semibold, design: .rounded))
            .foregroundColor(isSelected ? ViewColor.viewWhite : Color.gray.opacity(0.8))
    }
}



public  struct SettingSnippetSecondryItemText: View {
    public init(title: String, fontName: String? = nil, isSelected: Bool = false) {
        self.title = title
        self.fontName = fontName
        self.isSelected = isSelected
    }
    
    private var title: String
    private var fontName: String?
    private var isSelected = false
    
    public var body: some View {
        Text(title)
            .font(.system(size: 10, weight: .semibold, design: .rounded))
            .foregroundColor(isSelected ? ViewColor.viewWhite : Color.gray.opacity(0.9))
    }
}
