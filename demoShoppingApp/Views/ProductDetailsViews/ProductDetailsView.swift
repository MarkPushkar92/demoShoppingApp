//
//  ProductDetailsView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 06.01.2023.
//

import UIKit


// отрисовать все что ниже колор эн кэпэсити , разместить коллекшн,  добавить констрейнты

class ProductDetailsView: UIView {
    
    //MARK: Properties
    
    var details: ProductDetails?
    
    private let title: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 24)
        view.textAlignment = .center
        view.text = "Galaxy Note 20 Ultra"
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
    
    private let cpuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "CPU")
        return imageView
    }()
    
    private let sdImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "SD")
        return imageView
    }()
    
    private let sSDImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "ssd")
        return imageView
    }()
    
    private let cameraImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "camera")
        return imageView
    }()
    
    private let cpuLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    private let sdLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    private let ssdLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    private let cameraLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
      //  stack.spacing = 23
        return stack
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
     //   stack.spacing = 23
        return stack
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
    
    //MARK: Methods
    
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
        setupButtons()
        [cpuImage, cameraImage, sSDImage, sdImage].forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        [cpuLabel, cameraLabel, ssdLabel, sdLabel].forEach {
            labelStack.addArrangedSubview($0)
        }
        addSubviews(title, ratingStack, buttonStack, labelStack, saveToFavesButton, colorCapacityLabel)
//        let constrains = [
//
//
//        ]
//        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: Init
    
    init(details: ProductDetails) {
        super.init(frame: .zero)
        self.details = details
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}



