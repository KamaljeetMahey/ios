//
//  HeightGenderView.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//


//Finalized

import SwiftUI

struct HeightGenderView: View {
    
    @State var hideWeight = false
    @State var isCmOrInch = true
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    @State var height = ["180","175","170","165","160","155","150","145"]
    @State var gender = ["Gender-Male", "Gender-Female", "Gender-Other", "Prefer Not To Say"]
    
    var body: some View {
        HStack{
            
            VStack(alignment:.leading){
             
            Toggle("", isOn: $isCmOrInch)
                    .toggleStyle(CheckmarkToggleStyle(cmLabel: "cm-label".localized(language), inchLabel: "inch-label".localized(language)))
                    .offset(y:15)
                
            //Height
            Text("Height-Label")
                .font(.caption)
            
            //DropDown
                DropDown(options: height)
            
                HStack{
                    
                    Text("*")
                    
                    Text("Log-Weight-Label")
                        .font(.caption2)
                        .lineLimit(2)
                }
                
            //Gender
            Text("Gender-Label")
                .font(.caption)
                .padding(.top)
            
            //DropDown
            DropDown(options: gender)
            
            
            Toggle("Hide-Weight-Label", isOn:$hideWeight)
                .toggleStyle(iOSCheckboxToggleStyle())
                .font(.caption)
                .padding(.top)
                    
            }
        }
    }
}

struct HeightGenderView_Previews: PreviewProvider {
    static var previews: some View {
        HeightGenderView()
    }
}
