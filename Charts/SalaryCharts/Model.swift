//
//  File.swift
//  SalaryCharts
//
//  Created by Paras  on 30/03/23.
//

import Foundation
import Charts

struct SalaryData{
    
    let Salary: Double
    let Month: String
    let Index: Int
    let increment: Double
    let band: Double
    let designation: String
    
}

extension SalaryData{
    
    //Data transformation for bar Chart
    func transformToBarChartDataEntry() -> BarChartDataEntry {
        
        var salary: Double = Double()
        
//        let salaryArray = staticData.empSalary.map { $0.Salary
//        }
//        let maxSalary = salaryArray.max()!
        let maxSalary = 142000.0 
        
        if maxSalary <= 70000{
            
            let diff = (7.2 - maxSalary) / (maxSalary * 7.2)
            
            salary = ((Salary/10000) * (1 + diff ) ) + 0.5
            
        }
        else{
            
            let diff = (maxSalary - 7.2) / (maxSalary * 7.2)
            
            salary = (Salary/10000) * (1 - diff)
            
        }

        
        
        let entry = BarChartDataEntry(x: Double(Index), y: salary )
        return entry
        
    }
    
    //Data transformation for line Chart
    func transformToLineChartDataEntry() -> ChartDataEntry{
        
        let entry = ChartDataEntry(x: Double(Index), y:  (100 * (increment/Salary)) / 7.8 )
        return entry
        
    }
    
    
}

class StaticData{
    
    
    
    let empSalary:[SalaryData] = [SalaryData(Salary: 20500.0, Month: "Jan 15", Index: 0, increment: 0, band: 7, designation: "Jr. UI UX"),
                                  SalaryData(Salary: 23000.0, Month: "Aug 17", Index: 1, increment: 2500, band: 7, designation: "Jr. UI UX"),
                                  SalaryData(Salary: 28000.0, Month: "Sep 18", Index: 2, increment: 5000, band: 6, designation: "Sr. UI UX"),
                                  SalaryData(Salary: 36400.0, Month: "June 19", Index: 3, increment: 8400, band: 6, designation: "Pr. UI UX"),
                                  SalaryData(Salary: 40000.0, Month: "Oct 20", Index: 4, increment: 3600, band: 5.2, designation: "UX Analyst"),
                                  SalaryData(Salary: 50000.0, Month: "Oct 25", Index: 5, increment: 10000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 52000, Month: "Nov 19", Index: 6, increment: 2000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 55000, Month: "Dec 10", Index: 7, increment: 3000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 59000, Month: "Jan 19", Index: 8, increment: 4000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 61000, Month: "Feb 19", Index: 9, increment: 2000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 63000, Month: "March 19", Index: 10, increment: 2000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 65500, Month: "April 19", Index: 11, increment: 2500, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 68000, Month: "May 19", Index: 12, increment: 2500, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 72000, Month: "June 19", Index: 13, increment: 4000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 80000, Month: "July 19", Index: 14, increment: 8000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 90000, Month: "Aug 19", Index: 15, increment: 10000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 95000, Month: "Oct 19", Index: 16, increment: 5000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 100000, Month: "Nov 19", Index: 17, increment: 5000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 102000, Month: "Dec 19", Index: 18, increment: 2000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 122000, Month: "Jan 19", Index: 19, increment: 20000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 132000, Month: "Feb 19", Index: 20, increment: 10000, band: 5, designation: "Sr. UX Analyst"),
                                  SalaryData(Salary: 142000, Month: "March 15", Index: 21, increment: 10000, band: 5, designation: "Sr. UX Analyst")]
    
    
    
//    let empSalary:[SalaryData] = [SalaryData(Salary: 20500.0, Month: "Jan 15", Index: 0, increment: 0, band: 7, designation: "Jr. UI UX"),
//                                   SalaryData(Salary: 23000.0, Month: "Aug 17", Index: 1, increment: 2500, band: 7, designation: "Jr. UI UX"),
//                                   SalaryData(Salary: 28000.0, Month: "Sep 18", Index: 2, increment: 5000, band: 6, designation: "Sr. UI UX"),
//                                   SalaryData(Salary: 36400.0, Month: "June 19", Index: 3, increment: 8400, band: 6, designation: "Pr. UI UX"),
//                                   SalaryData(Salary: 40000.0, Month: "Oct 20", Index: 4, increment: 3600, band: 5.2, designation: "UX Analyst"),
//                                   SalaryData(Salary: 50000.0, Month: "Oct 25", Index: 5, increment: 10000, band: 5, designation: "Sr. UX Analyst"),
//                                   SalaryData(Salary: 52000, Month: "Nov 19", Index: 6, increment: 2000, band: 5, designation: "Sr. UX Analyst")]
    
    
    
    
    
    
}


