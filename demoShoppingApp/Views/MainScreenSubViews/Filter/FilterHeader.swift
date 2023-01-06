//
//  FilterHeader.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 04.01.2023.
//

import UIKit


class FilterHeaderView: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 86, height: 37)
        button.backgroundColor = .white
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Medium", size: 18)
        button.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    private let filterlabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 114, height: 23)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 18)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "Filter options", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    //MARK: Methods
    
    private func setupViews() {
        self.addSubviews(filterlabel, doneButton, dismissButton)
        let constrains = [
            dismissButton.heightAnchor.constraint(equalToConstant: 37),
            dismissButton.widthAnchor.constraint(equalToConstant: 37),
            dismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            dismissButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),

            filterlabel.heightAnchor.constraint(equalToConstant: 23),
            filterlabel.widthAnchor.constraint(equalToConstant: 114),
            filterlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            filterlabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 31),
            
            doneButton.heightAnchor.constraint(equalToConstant: 37),
            doneButton.widthAnchor.constraint(equalToConstant: 86),
            doneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            doneButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
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



