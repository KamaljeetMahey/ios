//
//  SetBarDynamicData.swift
//  SalaryCharts
//
//  Created by Paras  on 03/04/23.
//

import Foundation

class SetBarDynamicData{
    
    
    let staticData = StaticData()
    
    func setSalary(_ completion: @escaping ( _ div: Double , _ add : Double) -> ()){
        
        let salaryArray = staticData.empSalary.map { $0.Salary
        }
        let maxSalary = salaryArray.max()!
        
        if maxSalary <= 70000{
            
            completion( 10000, 0.4)
            
        }
        else{
            
            
            
        }
        
    }
    
}
