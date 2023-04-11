//
//  LoginView.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift



struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var errorMsg: String?
    
    @EnvironmentObject var router : Router<Path>
    @EnvironmentObject var user: User
    @EnvironmentObject var authenticationVM : AutheniticationVM
    @State var isLoggined = true
    
    
    var body: some View {
        
        VStack(spacing: 20){
            
            //TextFields
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            SecureField("Password", text: $password)

            
            //SignIn user
            Button{
                
                Auth.auth().signIn(withEmail: email, password: password){
                    result, error in
                    if let error = error{
                        isLoggined = false
                        return errorMsg = error.localizedDescription
                    }
                    
                    if let result = result {
                        result.user.sendEmailVerification()
                        isLoggined = true
                        user.userName = result.user.email!
                        print(user.userName)
                    }
                    
                    if isLoggined{
                        router.push(.C)
                    }
                    
                }
                
            }label:{
                
                    Text("Login..")
                        .foregroundColor(.blue)
                
            }
            
            
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                
//                if GIDSignIn.sharedInstance.hasPreviousSignIn(){
//                    GIDSignIn.sharedInstance.restorePreviousSignIn(){
//                        user , error in
////                        authenticateUser(for: user, with: error)
//                    }
//                }
                Task{
                    do{
                        try await authenticationVM.googleSignIn(){
                            result, error in
                            
                            if let error = error{
                                isLoggined = false
                                errorMsg = error
                            }
                            
                            if let result = result{
                                isLoggined = true
                                user.userName = result.userName
                                print(result.userName)
                                print(user.userName)
                            }
                        }
                    }
                    catch let err{
                        print(err.localizedDescription)
                    }
                    
                    if isLoggined{
                        router.push(.C)
                    }
                    
                }
                
                    
                
            }
            
            //Error handling
            if let error = errorMsg{
                Text("\(error)")
            }


        }
    }
    

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()

    }
}


