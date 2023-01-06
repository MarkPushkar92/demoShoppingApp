//
//  RoundButton.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 25.12.2022.
//

import UIKit

enum ButtonName: String {
    case phones
    case computer
    case health
    case books
    case qr
}

class CustomButton: UIButton {
    
    static var buttonArray = [CustomButton]()
            
    private var image: UIImage?
    
    private var buttonName: ButtonName
    
    init(buttonName: ButtonName) {
        self.buttonName = buttonName
        super.init(frame: .zero)
        setupButtonImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonImage() {
        switch buttonName {
        case .phones:
            image = UIImage(named: "phonesSvg")
            tintColor = UIColor(red: 0.702, green: 0.702, blue: 0.765, alpha: 1)
            setImage(image, for: .normal)
        case .computer:
            image = UIImage(named: "computer")
            setImage(image, for: .normal)
        case .health:
            image = UIImage(named: "healthSVG")
            setImage(image, for: .normal)
        case .books:
            image = UIImage(named: "bookSVG")
            setImage(image, for: .normal)
        case .qr:
            image = UIImage(named: "qr")
            setImage(image, for: .normal)
        }
        setupButton()

    }
    
    private func setupButton() {
        if buttonName == .qr {
            self.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            self.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        } else {
            self.backgroundColor = .white
            self.frame = CGRect(x: 0, y: 0, width: 71, height: 71)
        }
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width/2
        self.toAutoLayout()
    }
}



