//
//  FilterView.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 03.01.2023.
//

import UIKit

class FilterView: UIView {
    
    // переделать в tableView , передавать данные в cellforRowAt , сделать один массив и там по кейсам
    
    private let brands = ["Apple", "Samsung", "Xiaomi"]
    
    private let prices = ["100$-300$", "300$-500$", "500$-700$", "700$-1000$", "1000-10000"]
    
    private let sizes = ["Hi", "I", "am", "a", "test"]
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        return button
    }()
    
    private let doneButton: UIButton = {
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
    
    private let brandlabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 18)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "Brand", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let pricelabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 18)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "Price", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let sizelabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 18)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "Size", attributes: [NSAttributedString.Key.kern: -0.33])
        view.toAutoLayout()
        return view
    }()
    
    private let brandTextField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 337, height: 37)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let priceTextField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 337, height: 37)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let sizeTextField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 337, height: 37)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 23
        return stack
    }()
    
    private var pickerView = UIPickerView()
    
    private func setupViews() {
        pickerView.delegate = self
        pickerView.dataSource = self
        [brandTextField, sizeTextField, priceTextField].forEach {
            $0.inputView = pickerView
        }
        stack.addSubviews(brandlabel, brandTextField, pricelabel, priceTextField, sizelabel, sizeTextField)
        self.addSubviews(stack, filterlabel, doneButton, dismissButton)
        let constrains = [
            dismissButton.heightAnchor.constraint(equalToConstant: 37),
            dismissButton.widthAnchor.constraint(equalToConstant: 37),
            dismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            dismissButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),

            filterlabel.heightAnchor.constraint(equalToConstant: 23),
            filterlabel.widthAnchor.constraint(equalToConstant: 114),
            filterlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            filterlabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 31),
            
            dismissButton.heightAnchor.constraint(equalToConstant: 37),
            dismissButton.widthAnchor.constraint(equalToConstant: 86),
            dismissButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            dismissButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            stack.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: -44),
        ]
        NSLayoutConstraint.activate(constrains)
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

extension FilterView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        <#code#>
    }
}


    
    

