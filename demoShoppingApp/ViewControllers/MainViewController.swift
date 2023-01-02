//
//  MainViewController.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var homeStore: [HomeStore] = []
    
    private let networkService = NetworkService()

    weak var coordinator: Coordinator?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIDHot)
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
            self.applyData()
        }
    }
    
    //MARK: FUNCS
    
    private func applyData() {
        DispatchQueue.main.async {
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TableViewCell {
               cell.collectionView.reloadData()
            }
            self.tableView.reloadData()
        }
    }
}

//MARK: EXTENSIONS

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDHot, for: indexPath) as! TableViewCell
        cell.homeStore = homeStore
        cell.selectionStyle = .none
        return cell
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
        return 300
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





  
