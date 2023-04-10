//
//  ContentView.swift
//  March20-03
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var user : User = User()
    @ObservedObject private var account : Account = Account()
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Text("User Name is \(user.name)")
                    .font(.title2)
                
                TextField("user",text: $user.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink("Navigate to second view", destination: SecondView()).padding()
                    
                //vstack end
            }.padding()
            
            
                .navigationTitle(Text("Navigation "))
         //Navigation end
        }
        .environmentObject(user)
        .environmentObject(account)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
