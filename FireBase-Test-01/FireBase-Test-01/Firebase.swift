//
//  Firebase.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import Foundation
import FirebaseAuth
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore

class Firebase{
    
    func signInUser(email: String, password: String){
         
    }
}

class AutheniticationVM : ObservableObject {
    
    
        func googleSignIn(completion: @escaping (User?,String?) -> ()) async throws {
        
        //get client id from firebase
        guard let clientID = FirebaseApp.app()?.options.clientID else {fatalError("client id not rechable")}
        
        //Config for that id
        let configuration = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = configuration
        
        
        // get presenting view controller, access it through the shared instance of the UIApplication.
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene else {return completion(nil, "couldnt get windowscene")}
        guard let rootViewController = await windowScene.windows.first?.rootViewController else {return completion(nil, "couldnt get root view controller")}
        
        
        //User authentication and call sign in
        let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
        //get user
        let user = userAuthentication.user
        
        //get token id
        guard let idToken = user.idToken else { return completion(nil, "couldnt get id token") }
        
        //get access token
        let accessToken = user.accessToken
        
        
        //setup credentials
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                       accessToken: accessToken.tokenString)
        
        
        try await Auth.auth().signIn(with: credential)
        
        
    }
}
