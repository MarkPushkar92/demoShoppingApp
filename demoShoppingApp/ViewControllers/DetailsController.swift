//
//  BusketController.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 05.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: Properties
    
    private var details: ProductDetails?
    
    private var networkService = NetworkService()
    
    private var subView = ProductDetailsView()
    
    private let layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
    weak var coordinator: MainCoordinator?
    
    private let busketButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "busketIcn"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        button.sizeToFit()
        return button
    }()
    
    private let returnButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "return"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        button.sizeToFit()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        setupViews()
        networkService.fetchDetails { product in
            self.details = product
            self.applyData()
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: busketButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnButton)
        returnButton.addTarget(self, action: #selector(returnPressed), for: .touchUpInside)
    }
    
    @objc private func returnPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func applyData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupViews() {
        setupCollectionView()
        view.addSubview(subView)
        subView.layer.cornerRadius = 30
        let constrains = [
            busketButton.widthAnchor.constraint(equalToConstant: 37),
            busketButton.heightAnchor.constraint(equalToConstant: 37),
            
            returnButton.widthAnchor.constraint(equalToConstant: 37),
            returnButton.heightAnchor.constraint(equalToConstant: 37),

            subView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constrains)
        title = "Product details"
      
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        layout.scrollDirection = .horizontal
        collectionView.toAutoLayout()
        collectionView.register(DetailImageCell.self, forCellWithReuseIdentifier: String(describing: DetailImageCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        let constrains = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return details?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DetailImageCell.self), for: indexPath) as! DetailImageCell
        if let image = details?.images[indexPath.row] {
            cell.image.load(url: URL(string: image) ?? URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both")!)
        }
        return cell
    }
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width - 100
        
        let height: CGFloat = collectionView.bounds.height - 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

}


