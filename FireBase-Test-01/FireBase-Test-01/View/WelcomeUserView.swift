//
//  WelcomeUserView.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import SwiftUI

struct WelcomeUserView: View {
    
    @EnvironmentObject var router : Router<Path>
    @EnvironmentObject var user: User
    
    
    var body: some View {
        
        VStack(spacing: 20){
            let _ = print(user.userName)
            Text("Hello, \(user.userName)")
            Button {
                router.popToRoot()
            } label: {
                Text("Main view")
            }
        }
    }
}

struct WelcomeUserView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeUserView()
        
            
            
    }
}
