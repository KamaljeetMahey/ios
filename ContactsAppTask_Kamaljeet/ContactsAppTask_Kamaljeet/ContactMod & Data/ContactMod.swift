//
//  ContactMod.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation
import UIKit

class ContactMod{
    
    
    //MARK: Objects
    static let contactMod = ContactMod()
    var contactStaticData = ContactStaticData()
    
    
    //MARK: Properties
    var index: Int = 0
    var contactDataArray:[Contact] = []
    var sortContacts = SortContacts()
    private init() {}
    
   
    
    
    // Add Contact
    func addContact(firstName:String,lastName:String, number:[String],company:String){
        let contact = Contact(firstName: firstName,lastName: lastName, number: number, company: company )
        contactDataArray.insert(contact, at: 0)
        
    }
    
    // Update Contact
    
    
    
    
    
    
    
    
    // Delete Contact
    func deleteContact(indexPath: IndexPath){
        let contact = contactDataArray.remove(at: indexPath.row)
        
        for i in 0..<contactDataArray.count {
            if (contact.number == contactDataArray[i].number && contact.firstName == contactDataArray[i].firstName && contact.lastName == contactDataArray[i].lastName) {
                contactDataArray.remove(at: i)
                break
            }
            
            sortContacts.createSectionTitles(contactMod: ContactMod.contactMod)
//
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Generate Static Data
    func generateDataArray(){
        for i in 0..<contactStaticData.firstNameArr.count{
            
            addContact(firstName: contactStaticData.firstNameArr[i],lastName: contactStaticData.lastNameArr[i]!, number: contactStaticData.numbersArr[i],company: contactStaticData.companyArr[i] ?? "")
            
        }
        
    }
}
