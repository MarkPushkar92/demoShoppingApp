//
//  File.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 06.01.2023.
//

import UIKit

class BasketController: UIViewController {
    
    let networkService = NetworkService()
    
    let subView = BasketView()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        subView.updateView()
        
    }
    
    @objc private func returnPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupViews() {
        setupNavigation()
        view.addSubviews(subView)
        subView.networkService = networkService
        let constrains = [
            subView.topAnchor.constraint(equalTo: view.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(constrains)
       
    }
    
    
}

extension BasketController {
    
    private func setupNavigation() {
        let adressButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
            button.backgroundColor = .white
            button.setImage(UIImage(named: "location1"), for: .normal)
            button.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
            button.layer.cornerRadius = 10
            button.toAutoLayout()
            button.sizeToFit()
            return button
        }()
        
        let returnButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
            button.backgroundColor = .white
            button.setImage(UIImage(named: "return"), for: .normal)
            button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
            button.layer.cornerRadius = 10
            button.toAutoLayout()
            button.sizeToFit()
            return button
        }()
        
        let barLabel: UILabel = {
            let view = UILabel()
            view.frame = CGRect(x: 0, y: 0, width: 89, height: 19)
            view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
            view.font = UIFont(name: "MarkPro-Medium", size: 15)
            view.textAlignment = .center
            view.text = "Add address"
            view.toAutoLayout()
            return view
        }()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: adressButton), UIBarButtonItem(customView: barLabel)]
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnButton)
        returnButton.addTarget(self, action: #selector(returnPressed), for: .touchUpInside)
        
        let constrains = [
            adressButton.widthAnchor.constraint(equalToConstant: 37),
            adressButton.heightAnchor.constraint(equalToConstant: 37),
            
            returnButton.widthAnchor.constraint(equalToConstant: 37),
            returnButton.heightAnchor.constraint(equalToConstant: 37),
        ]
        NSLayoutConstraint.activate(constrains)
    }

    
}
