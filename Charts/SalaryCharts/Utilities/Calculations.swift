//
//  Calculations.swift
//  SalaryCharts
//
//  Created by Paras  on 03/04/23.
//

import Foundation

class Calculations {
    
    // MARK: methods
    func getSalaryAccordingToChartIndex(salary: Double) -> Double{
        return (salary/10_000)
    }
    
    func getIncrementAccordingToChartIndex(increment: Double, salary: Double) -> Double {
        let incrementPercentage = (increment/(salary-increment))*100
        return incrementPercentage
    }
    
    func convertToCurrencyFormat(intString: Int) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_IN")
        formatter.numberStyle = .decimal

        let asd = formatter.string(from: NSNumber(value: intString))
        
        return asd ?? String(intString);
    }
    
    func getDoublePrecision2(percentage: Double) -> String {
        return String(format: "%.2f", percentage)
    }
}
