//
//  ThirdView.swift
//  March20-03
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var user : User
    @EnvironmentObject var account : Account
    
    var body: some View {
        
        
        Text("Logged in user name \(user.name) with account balance of \(account.balance)")
        
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(User())
            .environmentObject(Account())
    }
}
