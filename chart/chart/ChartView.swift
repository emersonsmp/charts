//
//  ChartView.swift
//  chart
//
//  Created by Emerson Sampaio on 28/04/23.
//


import UIKit
import Charts
import TinyConstraints

class ChartView: UIView{
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 7.0),
        ChartDataEntry(x: 3.0, y: 5.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 5.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 12.0),
        ChartDataEntry(x: 10.0, y: 13.0),
        ChartDataEntry(x: 11.0, y: 5.0),
        ChartDataEntry(x: 12.0, y: 7.0),
        ChartDataEntry(x: 13.0, y: 3.0),
        ChartDataEntry(x: 14.0, y: 15.0),
        ChartDataEntry(x: 15.0, y: 6.0),
        ChartDataEntry(x: 16.0, y: 17.0),
        ChartDataEntry(x: 17.0, y: 16.0),
        ChartDataEntry(x: 18.0, y: 22.0),
        ChartDataEntry(x: 19.0, y: 20.0),
        ChartDataEntry(x: 20.0, y: 27.0),
        ChartDataEntry(x: 21.0, y: 23.0),
        ChartDataEntry(x: 22.0, y: 30.0),
        ChartDataEntry(x: 23.0, y: 50.0),
        ChartDataEntry(x: 24.0, y: 47.0),
        ChartDataEntry(x: 25.0, y: 55.0),
        ChartDataEntry(x: 26.0, y: 60.0),
        ChartDataEntry(x: 27.0, y: 39.0),
        ChartDataEntry(x: 28.0, y: 55.0),
        ChartDataEntry(x: 29.0, y: 70.0),
        ChartDataEntry(x: 30.0, y: 75.0),
        ChartDataEntry(x: 31.0, y: 58.0),
        ChartDataEntry(x: 32.0, y: 68.0),
        ChartDataEntry(x: 33.0, y: 77.0),
        ChartDataEntry(x: 34.0, y: 80.0),
        ChartDataEntry(x: 35.0, y: 69.0),
        ChartDataEntry(x: 36.0, y: 80.0),
        ChartDataEntry(x: 37.0, y: 90.0),
        ChartDataEntry(x: 38.0, y: 119.0),
        ChartDataEntry(x: 39.0, y: 110.0),
        ChartDataEntry(x: 40.0, y: 122.0)]
    
    let pieChartEntries = [
        PieChartDataEntry(value: 20, label: "Maçãs"),
        PieChartDataEntry(value: 30, label: "Laranjas"),
        PieChartDataEntry(value: 10, label: "Bananas"),
        PieChartDataEntry(value: 40, label: "Pêssegos")
    ]
    
    let colors: [UIColor] = [
        UIColor(red: 0.87, green: 0.49, blue: 0.73, alpha: 0.5),
        UIColor(red: 0.35, green: 0.67, blue: 0.38, alpha: 1),
        UIColor(red: 0.95, green: 0.77, blue: 0.06, alpha: 1),
        UIColor(red: 0.4, green: 0.55, blue: 0.74, alpha: 1)
    ]
    
    lazy var TitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "April Sales"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .systemBlue
        return title
    }()
    
    lazy var pieChartView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.backgroundColor = .white
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.animate(xAxisDuration: 2.5)
        return pieChart
    }()
    
    lazy var lineChartsView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .white
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .systemBlue
        yAxis.axisLineColor = .systemBlue
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .systemBlue
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        setData()
        setPieChartData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChartView {
    func style() {
        backgroundColor = .white
        addSubview(TitleLabel)
        addSubview(lineChartsView)
        addSubview(pieChartView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            TitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            TitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lineChartsView.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 20),
            lineChartsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineChartsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineChartsView.heightAnchor.constraint(equalToConstant: 300),
            
            pieChartView.topAnchor.constraint(equalTo: lineChartsView.bottomAnchor, constant: 20),
            pieChartView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pieChartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pieChartView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension ChartView: ChartViewDelegate {
    
//    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//        print(entry)
//    }
    
    func setData(){
        let set1 = LineChartDataSet(entries: yValues, label: "Abril Sales")
        
        //suavized lineChart
        set1.mode = .cubicBezier
        
        //Remove the Circlesin the lineChart
        set1.drawCirclesEnabled = false
        
        set1.lineWidth = 3
        set1.setColor(.white)
        
        //background color inside chart
        let colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: nil)!
        let fill = LinearGradientFill(gradient: gradient, angle: 70.0)
        set1.fill = fill
        //set1.fill = ColorFill(color: .white)
        set1.fillAlpha = 0.2
        set1.drawFilledEnabled = true
        
        //line indicator
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemRed
        set1.highlightLineWidth = 2
        
        let data = LineChartData(dataSet: set1)
        
        //show chart values(x,y) in line
        data.setDrawValues(false)
        
        let marker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        lineChartsView.marker = marker
        lineChartsView.data = data
    }
    
    func setPieChartData(){
        let set1 = PieChartDataSet(entries: pieChartEntries, label: "Fruits")
        set1.colors = colors
        set1.drawValuesEnabled = false
        set1.entryLabelColor = .white
        set1.entryLabelFont = .boldSystemFont(ofSize: 12)
        
        let data = PieChartData(dataSet: set1)
        
        pieChartView.data = data
    }
}

