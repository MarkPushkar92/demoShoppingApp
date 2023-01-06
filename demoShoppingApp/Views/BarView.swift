//
//  SelectCategoryView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 23.12.2022.
//

import UIKit

class BarView: UIView {
    
    //MARK: Properties
    
    private let whiteDot: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 8, height: 8)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.frame.width / 2
        view.toAutoLayout()
        return view
    }()
    
    private let label: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 59, height: 19)
        view.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 15)
        view.textAlignment = .center
        view.text = "Explorer"
        view.toAutoLayout()
        return view
    }()
    
    let busketButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 17.54, height: 18)
        view.backgroundColor = .white
        view.setImage(UIImage(named: "busketIcn"), for: .normal)
        view.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        view.toAutoLayout()
        return view
    }()
    
    let favesButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 17.54, height: 18)
        view.backgroundColor = .white
        view.setImage(UIImage(named: "barHeart"), for: .normal)
        view.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        view.toAutoLayout()
        return view
    }()
    
    private let personButton: UIButton = {
        let view = UIButton()
        view.frame = CGRect(x: 0, y: 0, width: 17.54, height: 18)
        view.backgroundColor = .white
        view.setImage(UIImage(named: "person"), for: .normal)
        view.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        view.toAutoLayout()
        return view
    }()
    
    //MARK: Methods
    
    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        self.layer.cornerRadius = 30
        
        self.addSubviews(whiteDot, label, busketButton, favesButton, personButton)
        let constrains = [
            
            whiteDot.widthAnchor.constraint(equalToConstant: 8),
            whiteDot.heightAnchor.constraint(equalToConstant: 8),
            whiteDot.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 68),
            whiteDot.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.heightAnchor.constraint(equalToConstant: 19),
            label.leadingAnchor.constraint(equalTo: whiteDot.trailingAnchor, constant: 7),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            busketButton.widthAnchor.constraint(equalToConstant: 18),
            busketButton.heightAnchor.constraint(equalToConstant: 18),
            busketButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 47),
            busketButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            favesButton.widthAnchor.constraint(equalToConstant: 18),
            favesButton.heightAnchor.constraint(equalToConstant: 18),
            favesButton.leadingAnchor.constraint(equalTo: busketButton.trailingAnchor, constant: 52),
            favesButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            personButton.widthAnchor.constraint(equalToConstant: 18),
            personButton.heightAnchor.constraint(equalToConstant: 18),
            personButton.leadingAnchor.constraint(equalTo: favesButton.trailingAnchor, constant: 52),
            personButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

        ]
        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}



