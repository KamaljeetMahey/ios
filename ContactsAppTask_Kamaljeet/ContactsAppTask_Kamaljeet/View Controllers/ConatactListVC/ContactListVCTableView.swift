//
//  File.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 03/03/23.
//

import Foundation
import UIKit


// TableView

extension ContactListVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitlesTemp.count
            
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortedContactListTemp[sectionTitlesTemp[section]]?.count ?? 0
        
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ContactCell
        let contact = sortedContactListTemp[sectionTitlesTemp[indexPath.section]]?[indexPath.row]
        cell.cellLabel?.text = {
                                if contact?.fullName == "#" {
                                    return (contact?.number[0])!
                                }
                                return contact?.fullName
                            }()
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if self.tableView(tableView, numberOfRowsInSection: section) == 0{
            return nil
        }
        
        return sortContacts.sectionTitles[section]
        
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {

        tableView.sectionIndexColor = .placeholderText
        
        return sectionTitlesTemp
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = sortedContactListTemp[sectionTitlesTemp[indexPath.section]]?[indexPath.row]
        
        performSegue(withIdentifier: "ToContactDetails", sender: (contact, indexPath))
        
    }
    
    
}


//MARK: Prepare Segue

extension ContactListVC{
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? ContactDetailsVC else {
            return
        }
        vc.data = sender as? (Contact, IndexPath)
         
    }
}
