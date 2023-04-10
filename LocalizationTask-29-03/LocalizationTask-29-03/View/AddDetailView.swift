//
//  AddDetailView.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//


//Finalized

import SwiftUI

struct AddDetailView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var DOB:Date = Date()
    
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading){
                
                
                //First Name
                Text("First-Name-Label")
                    .font(.caption)
                
                TextField("Enter-Name-Placeholder", text: $firstName)
                    .padding()
                    .font(.system(size: 12))
                    .background(.white)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                
                
                //Last Name
                Text("Last-Name-Label")
                    .font(.caption)
                    .padding(.top)
                
                TextField("Enter-Name-Placeholder"
                    , text: $lastName)
                    .padding()
                    .font(.system(size: 12))
                    .background(.white)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                
                
                //DOB
                Text("DOB-Label")
                    .font(.caption)
                    .padding(.top)
                
                
                DatePicker("", selection: $DOB, displayedComponents: .date)
                    .background(.white)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                    
                    
                    
                
                //Minimum Age Info Label
                HStack{
                    
                    Image(systemName: "info.circle")
                    
                    
                    Text("Minimum-Age-Label")
                        .font(.caption2)
                        .padding([.top, .trailing], 0.0)
                }
                .padding(.top, 5.0)
                .foregroundColor(.red)
                
            }
            
        }
        
    }//View End
}


struct AddDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailView()
    }
}
