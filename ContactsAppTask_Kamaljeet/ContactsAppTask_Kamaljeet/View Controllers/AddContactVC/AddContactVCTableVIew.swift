//
//  AddContactVCTableVIew.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 06/03/23.
//

import Foundation
import UIKit

struct TextFieldModel {
    var textFldData:String?
    init(textData: String){
        textFldData = textData
    }
}

extension AddContactVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfRows
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = addTableView.dequeueReusableCell(withIdentifier: "addNumberCell") as! AddNumberCell
            return cell
        }
        else{
            guard let cell = addTableView.dequeueReusableCell(withIdentifier: "deleteCell", for: indexPath) as? DeleteCell else{
                
                fatalError("error")
                
            }
            
            cell.addMobile.tag = indexPath.row
            cell.addMobile.delegate = self
            cell.addMobile.text = dataModel[indexPath.row].textFldData
            
            addContactArr.append(cell)
            
            return cell
        }
        
    }
    
    
    //Adding Rows
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if addContactArr[indexPath.row] == addContactArr[0] {
            
            numOfRows += 1
            
            addTableView.reloadData()
            
        }
    }
    
    
    //Set editing style
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0{
            return .insert
        }
        else{
            return .delete
        }
    }
    
    
    //Deleting Rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            addContactArr.remove(at: indexPath.row)
            numOfRows -= 1
            self.addTableView.performBatchUpdates({
                self.addTableView.deleteRows(at: [IndexPath(row:indexPath.row, section:0)], with: .automatic)
         })
           
        }
        
    }
    
    
    
}
