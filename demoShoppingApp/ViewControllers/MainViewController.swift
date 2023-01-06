//
//  MainViewController.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Reciving data
    
    private var homeStore: [HomeStore] = []
    private var bestSeller: [BestSeller] = []
    
    private let networkService = NetworkService()

    var coordinator: MainCoordinator?
    
    //MARK: UI props
    
    let headerview = SelectCategoryView()

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
    
    let customBar = BarView()
    
    //MARK: Filter Button
    
    private var transparentView = UIView()

    private let height: CGFloat = 400
    
    private let filterView = FilterTable(frame: .zero, style: .grouped)
        
    @objc private func filterButtonPressed() {
        filterView.headerview.dismissButton.addTarget(self, action: #selector(onClickTransparentView), for: .touchUpInside)
        filterView.headerview.doneButton.addTarget(self, action: #selector(onClickTransparentView), for: .touchUpInside)
        print("filter button pressed")
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        view.addSubview(transparentView)
        let screenSize = UIScreen.main.bounds.size
        filterView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        view.addSubview(filterView)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.filterView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
    @objc private func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.filterView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
    @objc private func headerButtonTapped(button: CustomButton) {
        print("hi circle button")
        if CustomButton.buttonArray.isEmpty {
            button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            CustomButton.buttonArray.append(button)
        } else {
            for i in CustomButton.buttonArray {
                i.backgroundColor = .white
                CustomButton.buttonArray.removeAll()
            }
            button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            CustomButton.buttonArray.append(button)
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
    
    @objc private func goToFaves() {
        coordinator?.gotoFaves()
    }
    
    @objc private func goToBusket() {
        coordinator?.gotoBusket()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        networkService.fetchData { allproducts in
            self.homeStore = allproducts.homeStore
            self.bestSeller = allproducts.bestSeller
            self.applyData()
        }
        customBar.favesButton.addTarget(self, action: #selector(goToFaves), for: .touchUpInside)
        customBar.busketButton.addTarget(self, action: #selector(goToBusket), for: .touchUpInside)
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
        
        headerview.filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        headerview.circleButtonPhones.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.circleButtonComp.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.circleButtonBooks.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.circleButtonHealth.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
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
        view.addSubview(customBar)
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: customBar.topAnchor),
            
            customBar.heightAnchor.constraint(equalToConstant: 72),
            customBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}



  
