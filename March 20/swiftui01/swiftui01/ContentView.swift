//
//  ContentView.swift
//  swiftui01
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userName : String = String()
    @State private var userPassword : String = String()
    
    var body: some View {
        VStack {
            
            
            
            Text("Login-Title").font(.largeTitle)
            
            Text("SwiftUI-Sample-Project").font(.subheadline).padding()
            
            TextField("username-tf", text: $userName )
                .padding()
                .background(Color.gray)
                .cornerRadius(4.0)
            
            SecureField("password-tf", text: $userPassword )
                .padding()
                .background(Color.gray)
                .cornerRadius(4.0)
            
            
            HStack{
                
                Button(action: {print("login tapped")}, label:{ Text("Login-Title")}).padding()
                
                
                Button(action: {print("Forgot tapped")}, label:{ Text("Forgot-password")}).padding()
                
                //hstack end
            }.padding()
            
            
            //vstack end
        }
        .padding()
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
