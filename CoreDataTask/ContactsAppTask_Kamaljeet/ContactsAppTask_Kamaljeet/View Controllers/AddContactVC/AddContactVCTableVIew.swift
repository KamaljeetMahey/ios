//
//  AddContactVCTableVIew.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 06/03/23.
//

import Foundation
import UIKit



extension AddContactVC: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfRows
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            // (+) Cell
            let cell = addTableView.dequeueReusableCell(withIdentifier: "addNumberCell") as! AddNumberCell
            return cell
        }
        else{
            
            // (-) Cell
            guard let cell = addTableView.dequeueReusableCell(withIdentifier: "deleteCell", for: indexPath) as? DeleteCell else{
                
                fatalError("error")
                
            }
                            //Adding Done Functionality to NumberPad
                            //Set Done Button in Number Pad Keyboard
                            //Create A toolBar
                            let bar = UIToolbar()
            
                            //Create Button with action
                            let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
            
            
                            //Create a flexSpace
                            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            
                            //Add creted Button items in toolBar
                            bar.items = [flexSpace,flexSpace,doneBtn]
                            bar.sizeToFit()
                            cell.addMobile.inputAccessoryView = bar
            
            //Keyboard Type
            cell.addMobile.keyboardType = .numberPad
            
            //Append Cell
            addContactArr.append(cell)
            
            
            return cell
        }
        
    }
    
    
    //Adding Rows
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if addContactArr[indexPath.row] == addContactArr[0] {
            
            numOfRows += 1
        
            
            tableView.beginUpdates()
            tableView.insertRows(at:[IndexPath(row: addContactArr.count, section: 0)], with: .automatic)
            tableView.endUpdates()
            
        }
    }
    
    
    //Set editing style --- (+) and (-) button in cells
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
