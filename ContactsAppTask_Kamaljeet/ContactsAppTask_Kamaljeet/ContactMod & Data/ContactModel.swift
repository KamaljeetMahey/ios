//
//  ContactModel.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation

class Contact{
    
    var firstName: String
    var lastName: String
    var number: [String]
    var company: String
    var fullName: String{
        get{
            if firstName == "" && lastName != "" {
                return lastName
            }else if lastName == "" && firstName != "" {
                return firstName
            }
            else if firstName != "" && lastName != ""{
                return firstName + " " + lastName
            }
            return "#"
        }
    }
    
    init(firstName: String, lastName:String, number: [String], company: String) {
        self.firstName = firstName
        self.number = number
        self.lastName = lastName
        self.company = company
    }
    
    
}
