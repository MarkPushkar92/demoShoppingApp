//
//  RoundButtonLabel.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 25.12.2022.
//


import UIKit

class CustomLabel: UILabel {
    
    private var labelName: ButtonName
    
    private var labeltext: String?
    
    init(labelName: ButtonName) {
        self.labelName = labelName
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        switch labelName {
        case .phones:
            labeltext = "Phones"
        case .computer:
            labeltext = "Computers"
        case .health:
            labeltext = "Health"
        case .books:
            labeltext = "Books"
        case .qr:
            break
        }
        
        self.frame = CGRect(x: 0, y: 0, width: 70, height: 15)
        self.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        self.font = UIFont(name: "MarkPro-Medium", size: 12)
        self.textAlignment = .center
        self.attributedText = NSMutableAttributedString(string: labeltext ?? "", attributes: [NSAttributedString.Key.kern: -0.33])
        self.toAutoLayout()
      
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 50,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
