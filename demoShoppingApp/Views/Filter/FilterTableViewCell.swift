//
//  FilterTableViewCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 04.01.2023.
//

import UIKit

class FilterCell: UITableViewCell {
    
    //MARK: Properties
    
    var dataArray: [String] = []
    
    let label: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Medium", size: 18)
        view.textAlignment = .center
        view.toAutoLayout()
        return view
    }()
    
    private let textField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 337, height: 37)
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 5
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let textFieldImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.down")
        image.tintColor = .darkGray
        image.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        image.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        image.toAutoLayout()
        return image
    }()
    
    private var pickerView = UIPickerView()
    
    //MARK: Init and View Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        addSubviews(label, textField)
        textField.addSubview(textFieldImage)
        let constrains = [
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textField.widthAnchor.constraint(equalToConstant: 337),
            textField.heightAnchor.constraint(equalToConstant: 37),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textFieldImage.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            textFieldImage.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -14)
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

extension FilterCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = "  \(dataArray[row])"
        textField.resignFirstResponder()
    }
}
