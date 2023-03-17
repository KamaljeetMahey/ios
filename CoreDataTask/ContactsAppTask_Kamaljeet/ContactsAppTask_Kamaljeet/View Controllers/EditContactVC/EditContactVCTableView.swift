//
//  EditContactVCTableView.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 16/03/23.
//

import Foundation
import UIKit

extension EditContactVC: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfRows
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0{
            // (+) Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "editCell1") as! EditCell1
            return cell
        }
        else{
            // (-) Cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "editCell2", for: indexPath) as? EditCell2 else{
                
                fatalError("error")
                
            }
            
            
            cell.numberTF.keyboardType = .numberPad
           
            if (cdContact?.number!.count)! >= editCellArr.count {
            
                if let text = cdContact?.number![indexPath.row-1] {
                    
                    cell.numberTF.text = text
                }
                
            }else {
                cell.numberTF.text = ""
            }
            
            editCellArr.append(cell)
            
            return cell
        }
        
    }
    
    
    
    //Adding Rows
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if editCellArr[indexPath.row] == editCellArr[0] {
            
            numOfRows += 1
            
            tableView.beginUpdates()
            tableView.insertRows(at:[IndexPath(row: editCellArr.count, section: 0)], with: .automatic)
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
            
            editCellArr.remove(at: indexPath.row)
            numOfRows -= 1
            self.tableView.performBatchUpdates({
                self.tableView.deleteRows(at: [IndexPath(row:indexPath.row, section:0)], with: .automatic)
         })
           
        }
        
    }
    
}
