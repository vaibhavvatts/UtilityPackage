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
        VStack(alignment: .leading) {
            HStack {
                if let titleIcon = titleIcon {
                    Image(systemName: titleIcon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
                if let title = title {
                    Text(title)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(ColorNames.keyWhite)
                }
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(ColorNames.title)
            }
        }
        .padding(.top)
        
    }
}

