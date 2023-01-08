//
//  ProductDetailsView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 06.01.2023.
//

import UIKit

class ProductDetailsView: UIView, UIGestureRecognizerDelegate {
    
    var onTap: (() -> Void)?
 
    var details: ProductDetails?

    //MARK: UI Properties
        
    private let title: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 24)
        view.textAlignment = .center
        view.toAutoLayout()
        return view
    }()
    
    private let ratingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.toAutoLayout()
        return stackView
    }()
    
    private let saveToFavesButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "barHeart"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    private let shopLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 20)
        view.textAlignment = .center
        view.text = "Shop"
        view.toAutoLayout()
        return view
    }()
    
    private let detailsLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.font = UIFont(name: "MarkPro", size: 20)
        view.textAlignment = .center
        view.text = "Details"
        view.toAutoLayout()
        return view
    }()
    
    private let featuresLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.font = UIFont(name: "MarkPro", size: 20)
        view.textAlignment = .center
        view.text = "Features"
        view.toAutoLayout()
        return view
    }()
        
    private let colorCapacityLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 196, height: 21)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 16)
               view.textAlignment = .center
        view.text = "Select color and capacity"
        view.toAutoLayout()
        return view
    }()
    
    private let colorButtonFirst: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 39.29, height: 39.29)
        button.layer.backgroundColor = UIColor(red: 0.467, green: 0.175, blue: 0.012, alpha: 1).cgColor
        button.setImage(UIImage(named: "tick"), for: .normal)
        button.layer.cornerRadius = button.frame.width / 2
        button.toAutoLayout()
        return button
    }()
    
    private let colorButtonSecond: UIButton = {
        var button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 39.29, height: 39.29)
        button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        button.layer.cornerRadius = button.frame.width / 2
        button.toAutoLayout()
        return button
    }()
    
    private let capacityLabelFirst: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 71.43, height: 30.36)
        view.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 13)
        view.textAlignment = .center
        view.text = "128 GB"
        view.toAutoLayout()
        return view
    }()
    
    private let capacityLabelSecond: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 69, height: 16)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 13)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "256 gb", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let buyView: UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 355, height: 54)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.toAutoLayout()
        return view
    }()
    
    private let addtoCartLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 112, height: 25)
        view.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 20)
        view.textAlignment = .center
        view.text = "Add to Cart"
        view.toAutoLayout()
        return view
    }()
    
    private let priceLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 99, height: 25)
        view.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 20)
        view.textAlignment = .center
        view.text = "$1,500.00"
        view.toAutoLayout()
        return view
    }()
    
    private let detailsStack = DetailsStackView()
    
    //MARK: Methods
    
    @objc private func handleTapOnBuyView() {
        onTap!()
    }
    
    private func setupButtons() {
        let filledStar = UIImage(named: "Star")
        for _ in 1 ... Int(details?.rating ?? 5) {
            let button = UIButton()
            button.toAutoLayout()
            button.setImage(filledStar, for: .normal)
            ratingStack.addArrangedSubview(button)
        }
    }
    
    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        setupButtons()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnBuyView))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.numberOfTouchesRequired = 1
        buyView.addGestureRecognizer(tapRecognizer)
        
        addSubviews(title, ratingStack, saveToFavesButton, colorCapacityLabel, colorButtonFirst, colorButtonSecond, capacityLabelFirst, capacityLabelSecond, buyView, addtoCartLabel, priceLabel, shopLabel, featuresLabel, detailsLabel, detailsStack)
        let constrains = [
            
            // fine constrains:
            
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            
            saveToFavesButton.widthAnchor.constraint(equalToConstant: 37),
            saveToFavesButton.heightAnchor.constraint(equalToConstant: 33),
            saveToFavesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 340),
            saveToFavesButton.topAnchor.constraint(equalTo: title.topAnchor),

            ratingStack.heightAnchor.constraint(equalToConstant: 18),
            ratingStack.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            ratingStack.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 7),
            
            shopLabel.heightAnchor.constraint(equalToConstant: 25),
            shopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            shopLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 57),
            
            detailsLabel.heightAnchor.constraint(equalToConstant: 25),
            detailsLabel.leadingAnchor.constraint(equalTo: shopLabel.trailingAnchor, constant: 69),
            detailsLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 57),
            
            featuresLabel.heightAnchor.constraint(equalToConstant: 25),
            featuresLabel.trailingAnchor.constraint(equalTo: saveToFavesButton.trailingAnchor),
            featuresLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 57),
            
            colorCapacityLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            colorCapacityLabel.topAnchor.constraint(equalTo: detailsStack.bottomAnchor, constant: 29),
            
            colorButtonFirst.widthAnchor.constraint(equalToConstant: 39.29),
            colorButtonFirst.heightAnchor.constraint(equalToConstant: 39.29),
            colorButtonFirst.leadingAnchor.constraint(equalTo: colorCapacityLabel.leadingAnchor),
            colorButtonFirst.topAnchor.constraint(equalTo: colorCapacityLabel.bottomAnchor, constant: 14),
            
            colorButtonSecond.widthAnchor.constraint(equalToConstant: 39.29),
            colorButtonSecond.heightAnchor.constraint(equalToConstant: 39.29),
            colorButtonSecond.leadingAnchor.constraint(equalTo: colorButtonFirst.trailingAnchor, constant: 19),
            colorButtonSecond.topAnchor.constraint(equalTo: colorCapacityLabel.bottomAnchor, constant: 14),
            
            capacityLabelFirst.heightAnchor.constraint(equalToConstant: 31),
            capacityLabelFirst.widthAnchor.constraint(equalToConstant: 71),
            capacityLabelFirst.leadingAnchor.constraint(equalTo: colorButtonSecond.trailingAnchor, constant: 58),
            capacityLabelFirst.centerYAnchor.constraint(equalTo: colorButtonFirst.centerYAnchor),
            
            capacityLabelSecond.heightAnchor.constraint(equalToConstant: 31),
            capacityLabelSecond.leadingAnchor.constraint(equalTo: capacityLabelFirst.trailingAnchor, constant: 21),
            capacityLabelSecond.centerYAnchor.constraint(equalTo: colorButtonFirst.centerYAnchor),
           
            buyView.trailingAnchor.constraint(equalTo: saveToFavesButton.trailingAnchor),
            buyView.heightAnchor.constraint(equalToConstant: 54),
            buyView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 29),
            buyView.topAnchor.constraint(equalTo: colorCapacityLabel.bottomAnchor, constant: 81),
            
            addtoCartLabel.leadingAnchor.constraint(equalTo: buyView.leadingAnchor, constant: 45),
            addtoCartLabel.centerYAnchor.constraint(equalTo: buyView.centerYAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: addtoCartLabel.trailingAnchor, constant: 61),
            priceLabel.centerYAnchor.constraint(equalTo: buyView.centerYAnchor),
            
            // stack constrains
            
            detailsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            detailsStack.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 41),
            detailsStack.trailingAnchor.constraint(equalTo: saveToFavesButton.trailingAnchor),
        
        ]
        NSLayoutConstraint.activate(constrains)
        
    }
    
    func reload() {
        title.text = details?.title
        detailsStack.cpuLabel.text = details?.cpu
        detailsStack.cpuLabel.text = details?.camera
        detailsStack.ssdLabel.text = details?.ssd
        detailsStack.sdLabel.text = details?.sd
        let priceStr: String = {
            var str = String(details?.price ?? 0)
            if str.count >= 4 {
                str.insert(",", at: str.index(str.endIndex, offsetBy: -3))
            }
            str.insert("$", at: str.startIndex)
            str.insert(contentsOf: ".00", at: str.endIndex)
            return str
        }()
        priceLabel.text = priceStr
       
    }
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}


