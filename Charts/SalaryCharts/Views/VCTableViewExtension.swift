//
//  VCTableViewExtension.swift
//  SalaryCharts
//
//  Created by Paras  on 31/03/23.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if isOpened{
            
            return staticData.empSalary.count + 1
        }
        
        
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        if indexPath.row == 0{
            
            let tapCell = tableView.dequeueReusableCell(withIdentifier: "tapCell", for: indexPath) as! TapCell
            
            return tapCell
            
        }
        
        else{
            
            let detailCell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
            
            if indexPath.row % 2 == 0{
                
                detailCell.backgroundColor = UIColor(hex: "#3080EA26")
                                
            }
            
            detailCell.setValues(salary: staticData.empSalary[staticData.empSalary.count - indexPath.row ].Salary, increment: staticData.empSalary[staticData.empSalary.count - indexPath.row ].increment, month: staticData.empSalary[staticData.empSalary.count - indexPath.row ].Month, designation: staticData.empSalary[staticData.empSalary.count - indexPath.row ].designation, band: staticData.empSalary[staticData.empSalary.count - indexPath.row ].band)
            
            return detailCell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            
            isOpened.toggle()
            
            tableView.reloadSections([indexPath.section], with: .none)
            
            tableHeightConstraint.constant = tableView.contentSize.height
        }
    }
    
    
    
}


