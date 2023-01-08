//
//  BusketFooter.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 08.01.2023.
//

import UIKit

class BasketFooter: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    private let checkoutLabel: UILabel = {
        var view = UILabel()
        view.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 20)
        view.textAlignment = .center
        view.text = "Checkout"
        view.toAutoLayout()
        return view
    }()
    
    private let totalLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Regular", size: 15)
        view.textAlignment = .center
        view.text = "Total"
        view.toAutoLayout()
        return view
    }()
    
    private let deliveryLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Regular", size: 15)
        view.textAlignment = .center
        view.text = "Delivery"
        view.toAutoLayout()
        return view
    }()
    
    let totalValueLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Regular", size: 15)
        view.textAlignment = .center
        view.text = "Total"
        view.toAutoLayout()
        return view
    }()
    
    let deliveryValueLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Regular", size: 15)
        view.textAlignment = .center
        view.text = "Delivery"
        view.toAutoLayout()
        return view
    }()
    
    private let lineTop: UIView = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 406, height: 0)
        view.backgroundColor = .white
        var stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -1, dy: -1)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -1, dy: -1)
        stroke.layer.borderWidth = 2
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        view.toAutoLayout()
        return view
    }()
    
    private let linemiddle: UIView = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 406, height: 0)
        view.backgroundColor = .white
        var stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        view.toAutoLayout()
        return view
    }()
    
    //MARK: Methods
    
    private func setupViews() {
      addSubviews(checkoutLabel, totalLabel, deliveryLabel, totalValueLabel, deliveryValueLabel, lineTop, linemiddle)
        let constrains = [
            
            lineTop.topAnchor.constraint(equalTo: self.topAnchor),
            lineTop.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            linemiddle.topAnchor.constraint(equalTo: checkoutLabel.topAnchor, constant: -27),
            linemiddle.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            checkoutLabel.widthAnchor.constraint(equalToConstant: 320),
            checkoutLabel.heightAnchor.constraint(equalToConstant: 54),
            checkoutLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkoutLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -44),
            
            totalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 55),
            totalLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            deliveryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 55),
            deliveryLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 12),
            
            totalValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 305),
            totalValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            deliveryValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 305),
            deliveryValueLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 12),



        ]
        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}



