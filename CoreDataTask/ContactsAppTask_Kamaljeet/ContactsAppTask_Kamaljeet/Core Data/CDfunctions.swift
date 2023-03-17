//
//  CDCRUD.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 15/03/23.
//

import Foundation
import CoreData

class CDFunctions{
    
    let contactDataRepo = ContactDataRepository()
    let contactStaticData = ContactStaticData()
    
    func generateCD(){
        
        for i in 0..<contactStaticData.firstNameArr.count{
            
            let contact = Contact(firstName: contactStaticData.firstNameArr[i], lastName: contactStaticData.lastNameArr[i] ?? "", number: contactStaticData.numbersArr[i], company: contactStaticData.companyArr[i] ?? "", id: UUID())
            
            contactDataRepo.create(contact: contact)
        }
        
    }
    
    func fetchEmployee(){
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path[0])
        
        do{
            var result = try PersistentStorage.shared.context.fetch(CDContact.fetchRequest())
            result.sort { ($0.fullName?.uppercased())! < ($1.fullName?.uppercased())!}
            result.forEach({debugPrint($0.fullName as Any, $0.number as Any)})
            
        } catch{
            debugPrint(error)}
    }
    
}
