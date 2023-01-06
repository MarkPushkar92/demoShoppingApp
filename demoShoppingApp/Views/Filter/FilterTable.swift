//
//  FilterTable.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 04.01.2023.
//

import UIKit

class FilterTable: UITableView {
    
    let headerview = FilterHeaderView()
    
    private let brands = ["Apple", "Samsung", "Xiaomi"]
    
    private let prices = ["100$-300$", "300$-500$", "500$-700$", "700$-1000$", "1000-10000"]
    
    private let sizes = ["Hi", "I", "am", "a", "test"]
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: EXTENSIONS

extension FilterTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: FilterCell.self), for: indexPath) as! FilterCell
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell.label.text = "Brand"
            cell.dataArray = brands
        case 1:
            cell.label.text = "Price"
            cell.dataArray = prices
        case 2:
            cell.label.text = "Size"
            cell.dataArray = sizes
        default:
            cell.label.text = "Brand"
            cell.dataArray = brands
        }
        return cell
    }

    
    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}

extension FilterTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

private extension FilterTable {
    func setupViews() {
        self.backgroundColor = .white
        self.separatorStyle = .none
        self.toAutoLayout()
        self.dataSource = self
        self.delegate = self
        self.register(FilterCell.self, forCellReuseIdentifier: String(describing: FilterCell.self))
        self.layer.cornerRadius = 30
    }
}





  
