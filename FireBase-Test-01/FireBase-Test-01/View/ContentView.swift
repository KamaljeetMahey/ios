//
//  ContentView.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var router = Router<Path>()
    @ObservedObject var user = User()
    @ObservedObject var authnticationVM = AutheniticationVM()
    
    var body: some View {
        NavigationStack(path: $router.paths){
            
            MainView()
            .navigationDestination(for: Path.self) { path in
                
                switch path{
                    
                case .A : SignUpView()
                case .B : LoginView()
                case .C : WelcomeUserView()
                
                    
                }
            }
            
        }.environmentObject(router)
        .environmentObject(user)
        .environmentObject(authnticationVM)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
