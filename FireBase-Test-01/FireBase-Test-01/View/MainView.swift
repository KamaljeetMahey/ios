//
//  MainView.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var router : Router<Path>
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Button {
                router.push(.A)
            } label: {
                Text("Sign Up")
                    .foregroundColor(.blue)
            }
            
            Button {
                router.push(.B)
            } label: {
                Text("Login")
                    .foregroundColor(.blue)
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
