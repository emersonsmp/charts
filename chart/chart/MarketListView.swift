//
//  MarketListView.swift
//  chart
//
//  Created by Emerson Sampaio on 01/05/23.
//

import Foundation
import UIKit
import Charts

class MarketListView: UIView, UITableViewDelegate{
    
    let stockList = [
        StockListModel(name: "ITSA3", company: "Itausa Holding", value: "12,40", variation: "+0,42"),
        StockListModel(name: "ITSA4", company: "Itausa Holding", value: "9,76", variation: "+0,32"),
        StockListModel(name: "ITUB3", company: "Itau Brasil", value: "21,40", variation: "+0,12"),
        StockListModel(name: "AMAR3", company: "Americanas LTDA", value: "12,40", variation: "+0,32"),
        StockListModel(name: "AGOL3", company: "Gol Linhas Aereas", value: "34,76", variation: "+10,32"),
        StockListModel(name: "APL34", company: "Apple Inc", value: "121,00", variation: "+2,57"),
        StockListModel(name: "ENER3", company: "Energisa Bra", value: "22,40", variation: "+0,32"),
        StockListModel(name: "BRAD4", company: "Bradesco", value: "19,40", variation: "+0,72"),
        StockListModel(name: "OIBR3", company: "Oi Brasil", value: "0,68", variation: "+0,02"),
        StockListModel(name: "OIBR4", company: "Oi Brasil", value: "0,52", variation: "+0,03")]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyHeader")
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: StockTableViewCell.reuseID)
        tableView.rowHeight = StockTableViewCell.rowHeight
        tableView.backgroundColor = .black
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MarketListView {
    func style() {
        addSubview(tableView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MarketListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockTableViewCell.reuseID, for: indexPath) as! StockTableViewCell
        cell.stockCodeNameLabel.text = stockList[indexPath.row].name
        cell.stockCompanyNameLabel.text = stockList[indexPath.row].company
        cell.valueLabel.text = stockList[indexPath.row].value
        cell.variationLabel.text = stockList[indexPath.row].variation
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyHeader") as? MyTableHeaderView else {
            return nil
        }
        headerView.titleLabel.text = "Stocks"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
