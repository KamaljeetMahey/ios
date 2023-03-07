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
        
        var first = firstNameTF.text ?? ""
        var last = lastNameTF.text ?? ""
        var company = companyNameTF.text ?? ""
        
        
        let number = getNumberArray()
        
        
        
        addContactDelegate.addContact(firstName: first , lastName: last, company: company, number: number)
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }

    }
    
    
}
