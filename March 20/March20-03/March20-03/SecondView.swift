//
//  SecondView.swift
//  March20-03
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var account : Account
    
    var body: some View {
        
        VStack{
            
            TextField("accoount", value: $account.balance, formatter: NumberFormatter()).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            NavigationLink("Navigate", destination: ThirdView())
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(Account())
    }
}
