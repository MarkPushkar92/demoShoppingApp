//
//  SelectCategoryView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 23.12.2022.
//

import UIKit

class SelectCategoryView: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    private let selectCategoryLabel: UILabel = {
        let label = UILabel()
      //  label.frame = CGRect(x: 0, y: 0, width: 193, height: 32)
        label.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Select Category", attributes: [NSAttributedString.Key.kern: -0.33])
        label.toAutoLayout()
        return label
    }()
    
    private let locationLabel: UILabel = {
        var view = UILabel()
     //   view.frame = CGRect(x: 0, y: 0, width: 119, height: 19)
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 15)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "Zihuatanejo, Gro", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.frame = CGRect(x: 0, y: 0, width: 12, height: 15.31)
        imageView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down" ), for: .normal)
    //    button.frame = CGRect(x: 0, y: 0, width: 10, height: 5)
        button.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        button.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        button.toAutoLayout()
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterImg"), for: .normal)
     //   button.frame = CGRect(x: 0, y: 0, width: 11, height: 13)
        button.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        button.toAutoLayout()
        return button
    }()
    
    private let viewAllLabel: UILabel = {
        var view = UILabel()
     //   view.frame = CGRect(x: 0, y: 0, width: 52, height: 19)
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 15)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "view all", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let searchTextField: TextFieldWithPadding = {
        let textfield = TextFieldWithPadding()
        textfield.placeholder = "Search"
        textfield.backgroundColor = .white
        textfield.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 0.5)
        textfield.font = UIFont(name: "MarkPro", size: 12)
        textfield.textAlignment = .left
        textfield.clipsToBounds = false
        textfield.layer.cornerRadius = 15
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let textfiledSubViewIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "searchIcon")
        image.toAutoLayout()
        return image
    }()
       
    //MARK: CircleButtons
    private let phoneLabel = CustomLabel(labelName: .phones)
    private let compLabel = CustomLabel(labelName: .computer)
    private let healthlable = CustomLabel(labelName: .health)
    private let bookLabel = CustomLabel(labelName: .books)
    
    private let circleButtonPhones = CustomButton(onTap: nil, buttonName: .phones)
    private let circleButtonComp = CustomButton(onTap: nil, buttonName: .computer)
    private let circleButtonHealth = CustomButton(onTap: nil, buttonName: .health)
    private let circleButtonBooks = CustomButton(onTap: nil, buttonName: .books)
    private let qrButton = CustomButton(onTap: nil, buttonName: .qr)
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 23
        return stack
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 23
        return stack
    }()

    //MARK: Methods
    
    private func setupViews() {
        
        [circleButtonPhones, circleButtonComp, circleButtonHealth, circleButtonBooks].forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        [phoneLabel, compLabel, healthlable, bookLabel].forEach {
            labelStack.addArrangedSubview($0)
        }
        
        searchTextField.addSubview(textfiledSubViewIcon)
        
        self.addSubviews(locationLabel, locationButton, selectCategoryLabel, viewAllLabel, locationIcon, filterButton, buttonStack, labelStack, searchTextField, qrButton)
        let constrains = [
            locationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            locationLabel.widthAnchor.constraint(equalToConstant: 119),
            locationLabel.heightAnchor.constraint(equalToConstant: 19),
            locationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            locationIcon.topAnchor.constraint(equalTo: locationLabel.topAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 12),
            locationIcon.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -11),
            locationIcon.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            
            locationButton.widthAnchor.constraint(equalToConstant: 10),
            locationButton.heightAnchor.constraint(equalToConstant: 5),
            locationButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            locationButton.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 8),
            
            filterButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            filterButton.trailingAnchor.constraint(equalTo: viewAllLabel.trailingAnchor),
            filterButton.widthAnchor.constraint(equalToConstant: 11),
            filterButton.heightAnchor.constraint(equalToConstant: 13),
            
            selectCategoryLabel.widthAnchor.constraint(equalToConstant: 193),
            selectCategoryLabel.heightAnchor.constraint(equalToConstant: 32),
            selectCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            selectCategoryLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 18),
          
            viewAllLabel.heightAnchor.constraint(equalToConstant: 19),
            viewAllLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 329),
            viewAllLabel.bottomAnchor.constraint(equalTo: selectCategoryLabel.bottomAnchor),
            
            labelStack.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 7),
            labelStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            
            buttonStack.heightAnchor.constraint(equalToConstant: 100),
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            buttonStack.trailingAnchor.constraint(equalTo: labelStack.trailingAnchor),
            buttonStack.topAnchor.constraint(equalTo: selectCategoryLabel.bottomAnchor, constant: 18),
            
            circleButtonPhones.widthAnchor.constraint(equalToConstant: 71),
            circleButtonPhones.heightAnchor.constraint(equalToConstant: 71),

            circleButtonComp.widthAnchor.constraint(equalToConstant: 71),
            circleButtonComp.heightAnchor.constraint(equalToConstant: 71),

            circleButtonHealth.widthAnchor.constraint(equalToConstant: 71),
            circleButtonHealth.heightAnchor.constraint(equalToConstant: 71),

            circleButtonBooks.widthAnchor.constraint(equalToConstant: 71),
            circleButtonBooks.heightAnchor.constraint(equalToConstant: 71),
            
            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 34),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            searchTextField.topAnchor.constraint(equalTo: labelStack.topAnchor, constant: 35),
            
            textfiledSubViewIcon.widthAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.heightAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            textfiledSubViewIcon.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 24),
            
            qrButton.widthAnchor.constraint(equalToConstant: 34),
            qrButton.heightAnchor.constraint(equalToConstant: 34),
            qrButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            qrButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 11)
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



