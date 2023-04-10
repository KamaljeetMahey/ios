//
//  DetailCell.swift
//  SalaryCharts
//
//  Created by Paras  on 31/03/23.
//

import UIKit

class DetailCell: UITableViewCell {

    
    @IBOutlet weak var setdate: UILabel!
    
    @IBOutlet weak var setBand: UILabel!
    
    @IBOutlet weak var setDesignation: UILabel!
    
    @IBOutlet weak var setSalary: UILabel!
    
    @IBOutlet weak var setIncrement: UILabel!
    
    func setValues(salary: Double, increment: Double, month: String, designation: String, band: Double){
        
        setSalary.text = String(salary)
        setIncrement.text = String(increment)
        setdate.text = month
        setBand.text = String(band)
        setDesignation.text = designation
    }
    
    
    
}
