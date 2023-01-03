//
//  MainViewController.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let networkService = NetworkService()

    weak var coordinator: Coordinator?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HotSalesTableCell.self, forCellReuseIdentifier: cellIDHot)
        tableView.register(BestSellerTableViewCell.self, forCellReuseIdentifier: cellIDBest)
        return tableView
    }()
    
    private let cellIDHot = "cellID"
    
    private let cellIDBest = "cellIDBest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       
        networkService.fetchData { allproducts in
            self.homeStore = allproducts.homeStore
            self.bestSeller = allproducts.bestSeller
            self.applyData()
        }
    }
    
    //MARK: FUNCS
    
    private func applyData() {
        DispatchQueue.main.async {
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? HotSalesTableCell {
               cell.collectionView.reloadData()
            }
            if let cell1 = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? BestSellerTableViewCell {
               cell1.collectionView.reloadData()
            }
            self.tableView.reloadData()
        }
    }
}

//MARK: EXTENSIONS

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDHot, for: indexPath) as! HotSalesTableCell
            cell.homeStore = homeStore
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDBest, for: indexPath) as! BestSellerTableViewCell
            cell.bestSeller = bestSeller
            cell.selectionStyle = .none
            return cell
        }

    }

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = SelectCategoryView()
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else {
            return 500
        }
    }
}

private extension MainViewController {
    func setupViews() {
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}





  
