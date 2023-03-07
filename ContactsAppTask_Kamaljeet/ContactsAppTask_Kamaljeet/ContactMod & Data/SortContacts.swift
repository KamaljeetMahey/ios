//
//  SortContacts.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation

class SortContacts{
 
    // MARK: Properties
    static let sortContacts = SortContacts()
    var sectionTitles: [String] = []
    var sortedContactList: [String: [Contact]] = [:]
    
    private init(){}
    
    // MARK: Methods
    func createSectionTitles(contactMod: ContactMod) {
        
        
        sectionTitles = Array(Set(contactMod.contactDataArray.compactMap({String($0.fullName.prefix(1)).uppercased()})))
        sectionTitles.sort()
        
        setDataForSections(contactMod: contactMod)
    }
    
    func setDataForSections(contactMod: ContactMod) {
        //initialize each
        for title in sectionTitles{
            sortedContactList[title] = [Contact]()
        }
        
        //add data to the dictionary
        for contact in contactMod.contactDataArray{

            sortedContactList[String(contact.fullName.prefix(1)).uppercased()]?.append(contact)
        }
        
        //sort names in each array inside dictionary
        for (key, _) in sortedContactList {
            sortedContactList[key] = sortedContactList[key]!.sorted(by: {
                $0.fullName.trimmingCharacters(in: .whitespaces).uppercased() < $1.fullName.trimmingCharacters(in: .whitespaces).uppercased()
                
            })
            

            
        }
    }
    
}
