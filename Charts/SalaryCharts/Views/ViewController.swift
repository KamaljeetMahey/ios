//
//  ViewController.swift
//  SalaryCharts
//
//  Created by Paras  on 30/03/23.
//

import UIKit
import Charts
import TinyConstraints



class ViewController: UIViewController , ChartViewDelegate{
    
    
    //MARK: Outlets
    @IBOutlet weak var combineChartView: CombinedChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    

    //MARK: Properties
    let staticData = StaticData()
    var isOpened = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Combine Chart View Setup
        setupCombineChartData()
        
        
        //TableView
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 5
    }
    
    
    //Set Combine Chart Data
    func setupCombineChartData(){
        
        let combineData = CombinedChartData()
        
        //Bar Data
        combineData.barData = setupBarChart()
        
        //Line Data
        combineData.lineData = setupLineChart()
        
        //Bar Width
        combineData.barData.barWidth = 0.1
        
        
        //Setting Data In Chart view
        combineChartView.data = combineData
        
        
        //Styling
        setCombineChartStyling()
        
        
    }
    
    
    //Combine Chart Styling
    func setCombineChartStyling(){
        
        
        //Pop up click view
        let marker:BalloonMarker = BalloonMarker(color: UIColor.white, font: UIFont(name: "Helvetica", size: 10)!, textColor: UIColor.black, insets: UIEdgeInsets(top: 4.0, left: 10.0, bottom: 3.0, right: 0.0))
        marker.arrowSize = CGSize(width: 8, height: 17)
        marker.minimumSize = CGSize(width: 110.0, height: 100.0)
        
        combineChartView.marker = marker
        
        
        
        //Zoom setting
        combineChartView.pinchZoomEnabled = false
        combineChartView.setScaleEnabled(false)
        combineChartView.setScaleMinima(2, scaleY: 1)
        
        
        //Maximum Visible Bars
        combineChartView.setVisibleXRangeMaximum(4)
        
        
        //Bar Shadow
        combineChartView.drawBarShadowEnabled = true
        
        
        //Grid Lines
        combineChartView.xAxis.drawGridLinesEnabled = false
        combineChartView.leftAxis.drawGridLinesEnabled = false
        combineChartView.rightAxis.drawGridLinesEnabled = false
        
        
        //Right Axis
        let combineRightAxis = combineChartView.getAxis(.right)
        
        combineRightAxis.valueFormatter = IndexAxisValueFormatter(values: ["0%","10%","20%","30%","40%","50%","60%","70%", "80%", "90%", "100%"] )
        combineRightAxis.labelCount = 10
        combineRightAxis.axisMinimum = 0
        combineRightAxis.axisMaximum = 10
        
        combineRightAxis.drawAxisLineEnabled = false
        
        
        
        //Left Axis
//        let combineLeftAxis = combineChartView.getAxis(.left)
//
//        combineLeftAxis.valueFormatter = IndexAxisValueFormatter(values: ["0k","10k","20k","30k","40k","50k","60k","70k"])
//        combineLeftAxis.labelCount = 7
//        combineLeftAxis.axisMinimum = 0
//        combineLeftAxis.axisMaximum = 7
//
//        combineLeftAxis.drawAxisLineEnabled = false
        setLeftAxisLabel()
        
        
        //Bottom Axis Labels
        
        let combineBottomAxis = combineChartView.xAxis
        
        combineBottomAxis.valueFormatter = IndexAxisValueFormatter(values: staticData.empSalary.map{ $0.Month
        })
       
        print(staticData.empSalary.map{ $0.Month
        })
        

        combineBottomAxis.labelCount = 3
        
        combineBottomAxis.axisMinimum = -0.5
        combineBottomAxis.axisMaximum =  Double(staticData.empSalary.count) - 0.5
        
        combineBottomAxis.axisLineWidth = 1.5
        combineBottomAxis.labelPosition = .bottom
        
        
        
        
        //Legend
        combineChartView.legend.enabled = false
    }
    
    
    func setLeftAxisLabel(){
        
        let combineLeftAxis = combineChartView.getAxis(.left)
        
        var labels: [String] = []
        
        
        
        let salaryArray = staticData.empSalary.map { $0.Salary
        }
        
        //max salary
        guard let maxSalary = salaryArray.max() else{
            labels = ["0k","10k","20k","30k","40k","50k","60k","70k"]
            combineLeftAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
            combineLeftAxis.labelCount = 7
            combineLeftAxis.axisMinimum = 0
            combineLeftAxis.axisMaximum = 7
            return
        }
        
        
        if maxSalary <= 70000{

            labels =  ["0k","10k","20k","30k","40k","50k","60k","70k"]

        }
        else{
            
            let topLabel: String = String(maxSalary)
            
            let setTopLabel = topLabel.substring(toIndex: 3)
            
            let difference = maxSalary/7
            
            for i in 0...6{
                
                labels.append("\(Int(difference/1000) * i) k")
                
            }
            
            labels.append("\(setTopLabel) k")
            
            
            
        }
        
        combineLeftAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        combineLeftAxis.labelCount = 7
        combineLeftAxis.axisMinimum = 0
        combineLeftAxis.axisMaximum = 7
        
        
        combineLeftAxis.drawAxisLineEnabled = false
        
        
        
    }
    
}
    



// Setting Data in Combine chart extension
extension ViewController{
    
    
    
    //MARK: Main Line Chart Data
    func setupLineChart() -> LineChartData{
        
        let lineChartEntries : [ChartDataEntry] = staticData.empSalary.map{ $0.transformToLineChartDataEntry()}
        
        let lineChartDataSet = LineChartDataSet(entries: lineChartEntries)
        
        //Circle
        lineChartDataSet.drawCircleHoleEnabled = false
        lineChartDataSet.colors = [.systemYellow]
        lineChartDataSet.circleRadius = 5
        lineChartDataSet.circleColors = [.systemGreen]
        lineChartDataSet.highlightLineWidth = 0
        
        //Dependency
        lineChartDataSet.axisDependency = .right
        
        //draw values disabled
        lineChartDataSet.drawValuesEnabled = false
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        return lineChartData
    }
    
    
    
    //MARK: Main Bar Chart Data
    func setupBarChart() -> BarChartData{
        
        let dataEntries: [BarChartDataEntry] = staticData.empSalary.map{$0.transformToBarChartDataEntry()}
        
        let barChartDataSet = BarChartDataSet(entries: dataEntries)
        
        
        
        //Bar color
        barChartDataSet.colors = [.systemPurple]
        
        //Dependency
        barChartDataSet.axisDependency = .left
        
        //draw values disabled
        barChartDataSet.drawValuesEnabled = false
        
        
        
        let barChartData = BarChartData(dataSet: barChartDataSet)
    
        return barChartData
    }
    
}


