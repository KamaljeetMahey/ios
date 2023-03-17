//
//  ContactDataRepo.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 15/03/23.
//

import Foundation
import CoreData

class ContactDataRepository{
    
    
    
    func create(contact: Contact){
        
        let cdContact = CDContact(context: PersistentStorage.shared.context)
        
        cdContact.firstName = contact.firstName
        cdContact.lastName = contact.lastName
        cdContact.company = contact.company
        cdContact.number = contact.number
        cdContact.fullName = contact.fullName
        cdContact.id = contact.id
        
        PersistentStorage.shared.saveContext()
        
    }
    
    
    
    func getAll() -> [Contact]? {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path)
        var contacts: [Contact] = []
        do {
            guard let result = try PersistentStorage.shared.context.fetch(CDContact.fetchRequest()) as? [CDContact] else {return nil}


            result.forEach { cdContact in
                let myContact = Contact(firstName: cdContact.firstName ?? "", lastName: cdContact.lastName ?? "", number: cdContact.number ?? ["#"], company: cdContact.company ?? "", id: cdContact.id!)
                contacts.append(myContact)
            }
        } catch let error {
            debugPrint(error)
        }
        return contacts

    }
    
    
    
    func delete(id: UUID) -> Bool {
        
        let cdContact = getCDContact(byIdentifier: id)
        guard cdContact != nil else { return false}
        
        PersistentStorage.shared.context.delete(cdContact!)
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    
    func update(contact: Contact) -> Bool {
        
        let record = getCDContact(byIdentifier: contact.id)
        
        guard record != nil else{ return false }
        
        record?.firstName = contact.firstName
        record?.lastName = contact.lastName
        record?.fullName = contact.fullName
        record?.number = contact.number
        record?.company = contact.company
        record?.id = contact.id
        
        PersistentStorage.shared.saveContext()
        return true
        
    }
    
    
     func getCDContact(byIdentifier id:UUID) -> CDContact?{
        
        let fetchRequest = NSFetchRequest<CDContact>(entityName: "CDContact")
        let predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            return result
            
        } catch let error {
            print(error)
        }
        
        return nil
        
    }

}
