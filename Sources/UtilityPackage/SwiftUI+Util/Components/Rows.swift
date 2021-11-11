//
//  SwiftUIView.swift
//  
//
//  Created by Vaibhav on 11/02/21.
//

import SwiftUI

public struct TitleSubtitleRow: View {
    public var title: String?
    public var titleIcon: String?
    public var subtitle: String?
    
    public init(title: String? = nil, titleIcon: String? = nil, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.titleIcon = titleIcon
    }
    
    public var body: some View {
        HStack {
            if let titleIcon = titleIcon {
                VStack(alignment: .leading) {
                    Image(systemName: titleIcon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(ColorNames.keyWhite)
                        .padding(.top, 4)
                    
                    Spacer()
                }
            }
            VStack(alignment: .leading) {
                if let title = title {
                    Text(title)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(ColorNames.keyWhite)
                    
//                    Spacer()
                }
                if let subtitle = subtitle {
                    HStack {
                        Text(subtitle)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(ColorNames.keyGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
            }
        }
    }
}

