//
//  ViewController.swift
//  chart
//
//  Created by Emerson Sampaio on 28/04/23.
//

import UIKit

class ViewController: UIViewController {

    var lineAndPieChart: ChartView?
    var candleStickscreen: CandleChartView?
    var StockList: MarketListView?
    
    override func loadView() {
        self.lineAndPieChart = ChartView()
        self.candleStickscreen = CandleChartView()
        self.StockList = MarketListView()
        
        self.view = self.StockList
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

