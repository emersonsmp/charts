//
//  CandleStickChartView.swift
//  chart
//
//  Created by Emerson Sampaio on 01/05/23.
//

import Foundation
import UIKit
import Charts

class CandleChartView: UIView {
    
    let yValues: [CandleChartDataEntry] = [
        CandleChartDataEntry(x: 0, shadowH: 65.50, shadowL: 60.00, open: 62.50, close: 64.50),
        CandleChartDataEntry(x: 1, shadowH: 70.25, shadowL: 61.75, open: 67.25, close: 63.25),
        CandleChartDataEntry(x: 2, shadowH: 69.50, shadowL: 65.50, open: 68.00, close: 66.25),
        CandleChartDataEntry(x: 3, shadowH: 71.50, shadowL: 66.00, open: 70.00, close: 69.50),
        CandleChartDataEntry(x: 4, shadowH: 73.50, shadowL: 69.25, open: 71.25, close: 72.25),
        CandleChartDataEntry(x: 5, shadowH: 75.50, shadowL: 71.50, open: 74.00, close: 73.25),
        CandleChartDataEntry(x: 6, shadowH: 76.50, shadowL: 71.75, open: 73.75, close: 74.50),
        CandleChartDataEntry(x: 7, shadowH: 78.25, shadowL: 73.25, open: 76.00, close: 75.50),
        CandleChartDataEntry(x: 8, shadowH: 77.50, shadowL: 73.75, open: 75.75, close: 74.25),
        CandleChartDataEntry(x: 9, shadowH: 80.25, shadowL: 75.25, open: 79.25, close: 77.75),
        CandleChartDataEntry(x: 10, shadowH: 81.00, shadowL: 77.50, open: 80.75, close: 80.50),
        CandleChartDataEntry(x: 11, shadowH: 82.00, shadowL: 78.75, open: 81.25, close: 79.75),
        CandleChartDataEntry(x: 12, shadowH: 81.25, shadowL: 77.50, open: 80.75, close: 79.25),
        CandleChartDataEntry(x: 13, shadowH: 80.75, shadowL: 76.50, open: 78.50, close: 78.75),
        CandleChartDataEntry(x: 14, shadowH: 82.00, shadowL: 78.25, open: 80.75, close: 80.50),
        CandleChartDataEntry(x: 15, shadowH: 85.00, shadowL: 79.50, open: 83.25, close: 81.75),
        CandleChartDataEntry(x: 16, shadowH: 84.75, shadowL: 80.00, open: 82.25, close: 81.50),
        CandleChartDataEntry(x: 17, shadowH: 83.50, shadowL: 78.75, open: 81.50, close: 79.25),
        CandleChartDataEntry(x: 18, shadowH: 80.75, shadowL: 77.50, open: 79.50, close: 79.00)]

    lazy var marketChart: CandleStickChartView = {
        let chartView = CandleStickChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.rightAxis.enabled = false // desativa o eixo da direita
        chartView.legend.enabled = false // desativa a legenda
        chartView.dragEnabled = true // habilita o arraste do gráfico
        chartView.setScaleEnabled(true) // habilita o zoom do gráfico
        chartView.pinchZoomEnabled = true // habilita o zoom por pinça
        chartView.highlightPerDragEnabled = true // habilita o destaque por arrasteß
        chartView.xAxis.labelPosition = .bottom
        
        chartView.backgroundColor = .black
        chartView.xAxis.axisLineColor = .white
        chartView.xAxis.labelTextColor = .white
        
        chartView.leftAxis.labelTextColor = .white
        
        return chartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        setPieChartData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension CandleChartView {
    func style() {
        addSubview(marketChart)
    }
    
    func layout() {
        
        NSLayoutConstraint.activate([
            marketChart.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            marketChart.leadingAnchor.constraint(equalTo: leadingAnchor),
            marketChart.trailingAnchor.constraint(equalTo: trailingAnchor),
            marketChart.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

extension CandleChartView: ChartViewDelegate {
    func setPieChartData(){
        let set1 = CandleChartDataSet(entries: yValues, label: "Ação")
        
        set1.drawVerticalHighlightIndicatorEnabled = false
        set1.highlightColor = .white
        set1.highlightLineWidth = 2
        
        set1.colors = ChartColorTemplates.joyful()
        set1.drawValuesEnabled = false
        set1.decreasingColor = .red // cor para candles de baixa (queda)
        set1.increasingColor = .green // cor para candles de alta (subida)
        set1.shadowColor = .white
        set1.neutralColor = .yellow // cor para candles neutros (sem variação)
        set1.increasingFilled = true
        
        let marker = MarketChartMarkerView(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        marketChart.marker = marker
        
        let data = CandleChartData(dataSet: set1)
        marketChart.data = data
    }
}
