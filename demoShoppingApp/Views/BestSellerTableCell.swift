//
//  BestSellerTableCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 02.01.2023.
//

import UIKit

class BestSellerTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    var bestSeller: [BestSeller] = []

    private let hotSales: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Best Seller", attributes: [NSAttributedString.Key.kern: -0.33])
        label.toAutoLayout()
        return label
    }()
    
    private let seeMore: UILabel = {
        var view = UILabel()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 15)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "see more", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    //MARK: Init and View Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        collectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: String(describing: HotSalesCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        addSubviews(seeMore, hotSales, collectionView)
        
        let constrains = [
            
            hotSales.widthAnchor.constraint(equalToConstant: 111),
            hotSales.heightAnchor.constraint(equalToConstant: 32),
            hotSales.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            hotSales.topAnchor.constraint(equalTo: self.topAnchor),
          
            seeMore.heightAnchor.constraint(equalToConstant: 19),
            seeMore.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 317),
            seeMore.bottomAnchor.constraint(equalTo: hotSales.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: hotSales.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: hotSales.bottomAnchor, constant: 10),
            
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

//MARK: Collection Extension

extension BestSellerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSeller.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HotSalesCell.self), for: indexPath) as! HotSalesCell
        let object = bestSeller[indexPath.row]
        
        return cell
    }
}

extension BestSellerTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 181
        let height: CGFloat = 227
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

