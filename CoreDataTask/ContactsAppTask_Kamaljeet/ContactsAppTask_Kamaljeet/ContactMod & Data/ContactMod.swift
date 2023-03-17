//
//  ContactMod.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation
import UIKit

class ContactMod{
    
    /*----------------------------------------------------------------------------------------------------------------------------
                                                    // Not Using this anymore
    -----------------------------------------------------------------------------------------------------------------------------*/
    
    //MARK: Objects
    static let contactMod = ContactMod()
    var contactStaticData = ContactStaticData()
    
    
    //MARK: Properties
    var index: Int = 0
    var contactDataArray:[Contact] = []
    var sortContacts = SortContacts.sortContacts
    private init() {}
    
    
    // Not Using Anymore
    // Delete Contact
    func deleteContact(indexPath: IndexPath){
        
        
        guard let contact = sortContacts.sortedContactList[sortContacts.sectionTitles[indexPath.section]]?.remove(at: indexPath.row) else {
            fatalError("error")
        }

        
        // removing elements from the data
        // so no element is regenerated when a new value
        // is added
        
        for i in 0..<contactDataArray.count {
            if (contact.fullName == contactDataArray[i].fullName) {
                contactDataArray.remove(at: i)
                break
            }
        }
        
        
        // remove entire key from sortContactList
        if sortContacts.sortedContactList[sortContacts.sectionTitles[indexPath.section]]?.count == 0{
            sortContacts.sortedContactList.removeValue(forKey: sortContacts.sectionTitles[indexPath.section])
        }
        
        sortContacts.createSectionTitles(contactMod: ContactMod.contactMod)
    }
    
    
}
