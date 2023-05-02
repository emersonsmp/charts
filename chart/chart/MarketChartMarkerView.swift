//
//  MarketChatMarkerView.swift
//  chart
//
//  Created by Emerson Sampaio on 01/05/23.
//

import Foundation
import UIKit
import Charts

class MarketChartMarkerView: MarkerView {
    var LineChart: LineChartView?
    var previousValue: Double = 0
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        addSubview(label)
    }
    
    func config (_ lineChart: LineChartView){
        self.LineChart = lineChart
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(context: CGContext, point: CGPoint) {
        var point = point
        point.x -= bounds.width / 2.0
        point.y -= bounds.height
        self.frame.origin = point
        super.draw(context: context, point: point)
    }
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
//        refreshHighlightValueColor(entry)
        refreshHighlightValue(entry: entry, highlight: highlight)
    }
    
    private func refreshHighlightValueColor(_ entry: ChartDataEntry){
        let backgroundColor: UIColor = (entry.y > previousValue) ? .green : .red
        label.backgroundColor = backgroundColor
        previousValue = entry.y
    }
    
    func refreshHighlightValue(entry: ChartDataEntry, highlight: Highlight) {
        label.text = "\(entry.y)"
        label.sizeToFit()
        self.frame.size = CGSize(width: label.frame.size.width + 20, height: label.frame.size.height + 10)
        label.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.setNeedsDisplay()
    }
}
