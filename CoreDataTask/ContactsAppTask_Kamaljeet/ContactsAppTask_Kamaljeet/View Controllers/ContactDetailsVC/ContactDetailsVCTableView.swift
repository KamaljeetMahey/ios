//
//  ContactDetailsVCTableView.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 06/03/23.
//

import Foundation
import UIKit

extension ContactDetailsVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.0.number.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        cell.numberLabel.text = data?.0.number[indexPath.row]
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let headerCell = UITableViewCell()
            return headerCell
        }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10    }
    
 
}
