//
//  AlertAction.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation
import UIKit

class AlertAction{
    
    func deleteContactAlert() -> UIAlertController {
       let ac = UIAlertController(title: "Delete Contact", message: nil, preferredStyle: .alert)
       
       ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        
       return ac
    }
    
}
