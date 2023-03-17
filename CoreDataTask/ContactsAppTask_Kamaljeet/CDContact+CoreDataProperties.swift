//
//  CDContact+CoreDataProperties.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 15/03/23.
//
//

import Foundation
import CoreData


extension CDContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDContact> {
        return NSFetchRequest<CDContact>(entityName: "CDContact")
    }

    @NSManaged public var company: String?
    @NSManaged public var firstName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var number: [String]?
    @NSManaged public var id: UUID?

}

extension CDContact : Identifiable {

}
