//
//  BusketViewCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 08.01.2023.
//

import UIKit

class BasketCell: UITableViewCell {
    
    var basket: Basket?
    
    func updateCell() {
        label.text = basket?.title
        guard let url = URL(string: basket?.images ?? "") else {return}
        image.load(url: url)
        let priceStr: String = {
            var str = String(basket?.price ?? 0)
            if str.count >= 4 {
                str.insert(",", at: str.index(str.endIndex, offsetBy: -3))
            }
            str.insert("$", at: str.startIndex)
            str.insert(contentsOf: ".00", at: str.endIndex)
            return str
        }()
        priceLabel.text = priceStr
    }
        
    private var image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 20)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.text = "Galaxy Note 20 Ultra"
        view.toAutoLayout()
        return view
    }()
    
    private var priceLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 20)
        view.text = "$3000.00"
        view.toAutoLayout()
        return view
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "removeBtn" ), for: .normal)
        button.toAutoLayout()
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus" ), for: .normal)
        button.toAutoLayout()
        button.tintColor = .white
        button.layer.backgroundColor = UIColor(red: 0.158, green: 0.156, blue: 0.262, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus" ), for: .normal)
        button.tintColor = .white
        button.toAutoLayout()
        button.layer.backgroundColor = UIColor(red: 0.158, green: 0.156, blue: 0.262, alpha: 1).cgColor
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.158, green: 0.156, blue: 0.262, alpha: 1)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "2"
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textAlignment = .center
        label.toAutoLayout()
        return label
    }()
    
    
    //MARK: Init and View Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
      
        addSubviews(image, label, priceLabel, minusButton, quantityLabel, plusButton, removeButton )
        
        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            label.widthAnchor.constraint(equalToConstant: 150),
            label.topAnchor.constraint(equalTo: image.topAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 6),

            minusButton.widthAnchor.constraint(equalToConstant: 26),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            minusButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 30),
            minusButton.topAnchor.constraint(equalTo: label.topAnchor),

            quantityLabel.widthAnchor.constraint(equalToConstant: 26),
            quantityLabel.heightAnchor.constraint(equalToConstant: 30),
            quantityLabel.leadingAnchor.constraint(equalTo: minusButton.leadingAnchor),
            quantityLabel.topAnchor.constraint(equalTo: minusButton.bottomAnchor),

            plusButton.widthAnchor.constraint(equalToConstant: 26),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.leadingAnchor.constraint(equalTo: minusButton.leadingAnchor),
            plusButton.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor),

            removeButton.widthAnchor.constraint(equalToConstant: 16),
            removeButton.heightAnchor.constraint(equalToConstant: 16),
            removeButton.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 17),
            removeButton.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),

        ]
        NSLayoutConstraint.activate(constrains)
    }
}
