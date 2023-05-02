//
//  StockTableViewCell.swift
//  chart
//
//  Created by Emerson Sampaio on 01/05/23.
//

import Foundation
import UIKit
import Charts

class StockTableViewCell : UITableViewCell {
    static let reuseID = "StockTableViewCell"
    static let rowHeight: CGFloat = 100
    
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
    
    lazy var stockCodeNameLabel: UILabel = {
        let code = UILabel()
        code.translatesAutoresizingMaskIntoConstraints = false
        code.text = "ITSA4"
        code.font = UIFont.preferredFont(forTextStyle: .body)
        code.textColor = .white
        return code
    }()
    
    lazy var stockCompanyNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Itaúsa Holding"
        name.textColor = .systemGray
        return name
    }()
    
    lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var marketChart: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .black
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.xAxis.enabled = false
        chartView.legend.enabled = false
        return chartView
    }()
    
    lazy var valueLabel: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "12,40"
        value.font = UIFont.preferredFont(forTextStyle: .body)
        value.textColor = .white
        return value
    }()
    
    lazy var variationLabel: UILabel = {
        let variation = UILabel()
        variation.translatesAutoresizingMaskIntoConstraints = false
        variation.text = "-0,32"
        return variation
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        buildHierarchy()
        setupConstraints()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.contentView.addSubview(stockCodeNameLabel)
        self.contentView.addSubview(stockCompanyNameLabel)
        self.contentView.addSubview(marketChart)
        self.contentView.addSubview(valueLabel)
        squareView.addSubview(variationLabel)
        self.contentView.addSubview(squareView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stockCodeNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            stockCodeNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            
            stockCompanyNameLabel.topAnchor.constraint(equalTo: stockCodeNameLabel.bottomAnchor, constant: 16),
            stockCompanyNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            
            marketChart.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            marketChart.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 200),
            //marketChart.centerXAnchor.constraint(equalTo: centerXAnchor),
            marketChart.widthAnchor.constraint(equalToConstant: 100),
            marketChart.heightAnchor.constraint(equalToConstant: 80),
            
            valueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            squareView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 16),
            squareView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            squareView.widthAnchor.constraint(equalToConstant: 60),
            squareView.heightAnchor.constraint(equalToConstant: 30),
            
            variationLabel.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            variationLabel.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
        ])
    }
}

extension StockTableViewCell: ChartViewDelegate {
    
    func setData(){
        let set1 = LineChartDataSet(entries: yValues, label: "Abril Sales")
        
        //suavized lineChart
        set1.mode = .cubicBezier
        
        //Remove the Circlesin the lineChart
        set1.drawCirclesEnabled = false
        
        set1.lineWidth = 1
        set1.setColor(.green)
        
        //background color inside chart
        let colors = [UIColor.white.cgColor, UIColor.green.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: nil)!
        let fill = LinearGradientFill(gradient: gradient, angle: 70.0)
        set1.fill = fill
        set1.fillAlpha = 0.2
        set1.drawFilledEnabled = true
        
        //line indicator
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.drawVerticalHighlightIndicatorEnabled = false
        
        let data = LineChartData(dataSet: set1)
        
        //show chart values(x,y) in line
        data.setDrawValues(false)
        marketChart.data = data
    }
}
