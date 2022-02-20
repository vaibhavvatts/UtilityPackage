//
//  SwiftUIView.swift
//  
//
//  Created by Vaibhav on 11/02/21.
//

import SwiftUI

@available(watchOS 6, *)
public struct NavBarBtn: View {
    public var title: String?
    public var imgName: String?
    
    public init(title: String? = nil, imgName: String? = nil) {
        self.title = title
        self.imgName = imgName
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            if imgName != nil {
                Image(systemName: imgName!)
                    .modifier(NavBtnImgModifier())
            }
            Text(title ?? "")
                .modifier(NavBtnTxtModifier())
        }
    }
}

public struct HeaderView<Content>: View where Content : View {
    public init(title: String, leftSideContent: @escaping () -> Content, rightSideContent: @escaping () -> Content) {
        self.title = title
        self.leftSideContent = leftSideContent
        self.rightSideContent = rightSideContent
    }
    private var title: String
    private var leftSideContent: () -> Content
    private var rightSideContent: () -> Content
    
    public var body: some View {
        ZStack {
            HStack {
                self.leftSideContent()
                    .buttonStyle(CustomButtonStyle())
                Spacer()
                self.rightSideContent()
                    .buttonStyle(CustomButtonStyle())
            }
            HStack {
                Spacer()
                Text(self.title)
                    .modifier(ModiTxtStyle(.titleRegular))
                Spacer()
            }
        }
#if targetEnvironment(macCatalyst)
        .padding(.bottom)
#else
        .padding(.vertical)
#endif
        .padding(.horizontal, UtilConstants.Spacing.boxIntermittentPadding)
    }
}
