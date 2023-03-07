//
//  Delegates.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 06/03/23.
//

import Foundation
import UIKit

protocol AddContactDelegate{
    
    func addContact(firstName first:String, lastName last:String, company: String, number: [String])
    
}
