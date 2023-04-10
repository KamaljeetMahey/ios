//
//  TestView.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI

struct TestView: View {
    @State var check = true
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Toggle("", isOn: $check)
                    .toggleStyle(CheckmarkToggleStyle(cmLabel: "cm", inchLabel: "inch"))
                    .padding(.trailing)
                
            }
            
            Spacer()
        }
        .padding(.trailing)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
