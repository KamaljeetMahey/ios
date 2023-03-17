//
//  SaveContact.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 06/03/23.
//

import Foundation
import UIKit

extension AddContactVC {
    
    
    
    @objc func saveContact(){
        
        
        let number = getNumberArray()
        
        let contact = Contact(firstName: firstNameTF.text!, lastName: lastNameTF.text!, number: number , company: companyNameTF.text!, id: UUID())
        
        self.contactDataRepo.create(contact: contact)
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }

    }
    
    
    
    //Get Numbers from TextFields
    func getNumberArray() -> [String]{
        
        
        var numbers: [String] = []
        
        for cell in addContactArr{
            if let number = cell?.addMobile.text{
                if number != ""{
                    numbers.append(number)
                }
            }
        }
        return numbers
    }
    
}
