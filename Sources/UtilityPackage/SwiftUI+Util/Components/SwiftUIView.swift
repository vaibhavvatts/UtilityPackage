//
//  SwiftUIView.swift
//  
//
//  Created by Vaibhav on 16/02/22.
//

import SwiftUI

public struct CheckBoxTextCircleStyle: View {
    public init(isSelected: Binding<Bool>, txt: String = "", secondTxt: String = "") {
        self.isSelected = isSelected
        self.txt = txt
        self.secondTxt = secondTxt
    }
    
    private var isSelected: Binding<Bool>
    private var txt: String = ""
    private var secondTxt: String = ""
    
    public var body: some View {
        Button(action: {
            HapticEngine.generateSoftHaptic()
            isSelected.wrappedValue.toggle()
        }) {
            HStack {
                Image(systemName: isSelected.wrappedValue ? "checkmark.circle.fill" : "checkmark.circle")
                VStack(alignment: .leading) {
                    Text(txt)
                        .modifier(ModiTxtStyle(.titleRegular))
                    if !secondTxt.isEmpty {
                        Text(secondTxt)
                            .modifier(ModiTxtStyle(.footNote))
                    }
                }
                Spacer()
            }
            .foregroundColor(isSelected.wrappedValue ? ViewColor.viewWhite : .gray)
        }
    }
}

