//
//  CheckBoxToggle.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import Foundation
import SwiftUI



struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width: 20, height: 20)

                configuration.label
                    .foregroundColor(.black)
            }
        })
    }
}

struct CheckmarkToggleStyle: ToggleStyle {
    
    var cmLabel: String
    var inchLabel: String
    
    
    init(cmLabel: String, inchLabel: String) {
        self.cmLabel = cmLabel
        self.inchLabel = inchLabel
    }
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 130, height: 31)
                .overlay(
                    Rectangle()
                        .foregroundColor(.white)
                        .padding([.bottom, .top], 2)
                        .padding([.leading],configuration.isOn ? 3 : 10 )
                        .padding([.trailing], configuration.isOn ? 15 : 0)
                        .overlay(
                            Text(configuration.isOn ? cmLabel : inchLabel)
                                .offset(x : configuration.isOn ? -30 : 30)
                        )
                        .offset(x: configuration.isOn ? 65 : -65)
                        
                ).cornerRadius(4)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
    
}
