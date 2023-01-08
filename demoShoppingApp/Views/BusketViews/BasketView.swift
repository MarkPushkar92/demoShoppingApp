//
//  BusketView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 08.01.2023.
//

import UIKit

class BasketView: UIView {
    
    var networkService: NetworkService?
    
    var basket: BasketContainer?
    
    private let label: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 138, height: 44)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 35)
        view.textAlignment = .center
        view.text = "My Cart"
        view.toAutoLayout()
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BasketCell.self, forCellReuseIdentifier: cellID)
        tableView.layer.cornerRadius = 30
        return tableView
    }()
    
    private let cellID = "CellID"
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubviews(label, tableView)
        self.toAutoLayout()
        let constrains = [
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42),
            
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50)
        ]
        NSLayoutConstraint.activate(constrains)
        
    }
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        networkService?.fetchBusket(completionHandler: { object in
            self.basket = object
            self.applyData()
        })
    }
    private func applyData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: EXTENSIONS

extension BasketView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket?.basket.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BasketCell
        cell.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        cell.selectionStyle = .none
        cell.basket = basket?.basket[indexPath.row]
        cell.updateCell()
        return cell
        
    }

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = BasketFooter()
        footer.deliveryValueLabel.text = basket?.delivery
        let priceStr: String = {
            var str = String(basket?.total ?? 0)
            if str.count >= 4 {
                str.insert(",", at: str.index(str.endIndex, offsetBy: -3))
            }
            str.insert("$", at: str.startIndex)
            str.insert(contentsOf: ".00", at: str.endIndex)
            return str
        }()
        footer.totalValueLabel.text = priceStr
        return footer
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 220
    }
}

extension BasketView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

