//
//  ViewController.swift
//  ChartsDemo
//
//  Created by binyu on 2021/6/14.
//

import UIKit
import Charts
import TinyConstraints

class ViewController: UIViewController,ChartViewDelegate {
    
    lazy var lineChartView: LineChartView =  {
       let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: true)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: true)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()

    let yValue: [ChartDataEntry] = (0...40).map { number -> ChartDataEntry in
        return ChartDataEntry(x: Double(number), y: Double(Int.random(in: 1...55)))
    }
    
    
    
    func setData() {
        let set1 = LineChartDataSet(entries: yValue, label: "subscribers")
        set1.mode = .cubicBezier
        set1.lineWidth = 3
        set1.fill = .init(color: .white)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemRed
        
        set1.drawCirclesEnabled = false
        

        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        print(yValue)
        setData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
        
    }


}

