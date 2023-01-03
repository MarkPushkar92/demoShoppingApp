//
//  BestSellerCollectionCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 03.01.2023.
//



import UIKit


class BestSellerCollectionCell: UICollectionViewCell {
    
    var image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let button: UIButton = {
        let view = UIButton()
        view.toAutoLayout()
        view.setImage(UIImage(named: "heart"), for: .normal)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.layer.cornerRadius = view.frame.width/2
        return view
    }()
    
    var nameLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 122, height: 13)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 10)
        view.attributedText = NSMutableAttributedString(string: "Samsung Galaxy s20 Ultra", attributes: [NSAttributedString.Key.kern: -0.33])
        view.sizeToFit()
        view.toAutoLayout()
        return view
    }()
    
    var priceLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 16)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "$1,047", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    var discountPriceLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 33, height: 13)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 10)
         view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "$1,500", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.kern: -0.33])
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
        backgroundColor = .white
        layer.cornerRadius = 10
        contentView.addSubviews(image, button, nameLabel, priceLabel, discountPriceLabel)

        let constrains = [
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            image.heightAnchor.constraint(equalToConstant: 168),
            
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            priceLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 7),
            
            discountPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 7),
            discountPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
