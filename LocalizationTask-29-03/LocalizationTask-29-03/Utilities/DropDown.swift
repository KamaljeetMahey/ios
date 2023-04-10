//
//  DropDown.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI

struct DropDown: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @State var options: [String]
    @State var locationIndex = 0
    
    @State var optionValue: String = ""
    
    
    var body: some View {
        
        Menu{
            ForEach(options, id: \.self) {
                option in
                Button(LocalizedStringKey(option)) {
                    self.optionValue = option
                }
            }
        }label: {
            VStack(spacing: 5){
                HStack(alignment: .center) {
                    Text(optionValue.isEmpty ? "Select-Placeholder".localized(language) : optionValue)
                        .foregroundColor(optionValue == "" ? .gray : .black)
                        .frame(height: 50)
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "chevron.down").padding(.trailing)
                        .foregroundColor(.gray)
                }.overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            }
        }.padding(.bottom, 24)
            
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown(options: ["Male", "Female", "Other"])
    }
}
