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
        HStack {
            if imgName != nil { Image(systemName: imgName!) }
            Text(title ?? "")
        }
        .modifier(NavBtnModifier())
    }
}
