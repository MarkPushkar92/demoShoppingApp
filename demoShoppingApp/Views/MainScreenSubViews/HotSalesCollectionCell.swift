//
//  HotSalesCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 29.12.2022.
//

import UIKit


class HotSalesCollectionCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.isHidden = true
        button.setTitle("New", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        button.layer.masksToBounds = true
        button.frame = CGRect(x: 0, y: 0, width: 27, height: 27)
        button.layer.cornerRadius = button.frame.width/2
        return button
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy Now!", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 11, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.toAutoLayout()
        return button
    }()
    
    let nameLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 25, weight: .bold)
        view.textAlignment = .left
        view.attributedText = NSMutableAttributedString(string: "Iphone 12", attributes: [NSAttributedString.Key.kern: -0.33])
        view.sizeToFit()
        view.toAutoLayout()
        return view
    }()
    
    let subLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 91, height: 13)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 11, weight: .regular)
        view.textAlignment = .left
        view.attributedText = NSMutableAttributedString(string: "Súper. Mega. Rápido.", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        contentView.addSubviews(image)
        image.addSubviews(button, buyButton, nameLabel, subLabel)

        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            button.widthAnchor.constraint(equalToConstant: 27),
            button.heightAnchor.constraint(equalToConstant: 27),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            
            buyButton.widthAnchor.constraint(equalToConstant: 92),
            buyButton.heightAnchor.constraint(equalToConstant: 23),
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -34),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            nameLabel.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -44),

            subLabel.widthAnchor.constraint(equalToConstant: 110),
            subLabel.heightAnchor.constraint(equalToConstant: 13),
            subLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            subLabel.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -26),
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
