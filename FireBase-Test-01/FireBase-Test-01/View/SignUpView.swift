//
//  SignUpView.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import SwiftUI
import FirebaseAuth
import Firebase

 
struct SignUpView: View {
    
    @State var email = ""
    @State var setPassword = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var errorMsg = ""
    @State var userCreated = false
    
    @EnvironmentObject var router : Router<Path>
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(spacing: 20){
            
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            
            TextField("Email", text: $email)
            TextField("Set Password", text: $setPassword)
            
            
            Button {
                
            } label: {
                Text("Google Sign up")
            }

            
            
            Button{
                
                //Validate the fields
                
                //Create the user
                Auth.auth().createUser(withEmail: email, password: setPassword){
                    (signUpResult,err) in
                    if let err = err{
                        
                        userCreated = false
                        errorMsg = err.localizedDescription
                    }
                    else {
                        
                        //Firestore
                        let db = Firestore.firestore()
                        
                        let uid = signUpResult!.user.uid
                        
                        let doc = db.collection("users").document(uid)
                        doc.setData(["firstName" : "\(firstName)" ,
                                     "lastName" : "\(lastName)"]){
                            error in
                            if let err = err{
                                errorMsg = err.localizedDescription
                                print(err.localizedDescription)
                            }
                        }
                        user.userName = "\(firstName) \(lastName)"
                        userCreated = true
                    }
                }
                
                
                //Transition to the Welcome Screen
                if userCreated{
                    router.push(.C)
                }
            }label: {
                
                
                    Text("SignUp")
                        .foregroundColor(.blue)
                

            }
            
            if !errorMsg.isEmpty{
                Text("\(errorMsg)")
            }

        }
 
    }
    
    private func validate(){
        
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
