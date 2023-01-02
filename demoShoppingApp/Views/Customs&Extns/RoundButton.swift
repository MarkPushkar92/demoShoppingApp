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
    
    private var image: UIImage?
    
    private var onTap: (() -> Void)?
    
    private var buttonName: ButtonName
    
    init(onTap: (() -> Void)?, buttonName: ButtonName) {
        self.buttonName = buttonName
        self.onTap = onTap
        super.init(frame: .zero)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        print("button tapped")
     //   onTap?()
    }
    
    private func setupButton() {
        switch buttonName {
        case .phones:
            image = UIImage(named: "phonesSvg")
            imageV.tintColor = UIColor(red: 0.702, green: 0.702, blue: 0.765, alpha: 1)
        case .computer:
            image = UIImage(named: "computer")
        case .health:
            image = UIImage(named: "health")
        case .books:
            image = UIImage(named: "books")
        case .qr:
            image = UIImage(named: "qr")
        }
        setupLayers()
        setupImageView()
        imageV.image = image
    }
    
    private var imageV: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        return image
    }()
    
    private func setupImageView() {
        if buttonName == .qr {
            self.addSubview(imageV)
            let constrains = [
                imageV.widthAnchor.constraint(equalToConstant: 14.5),
                imageV.heightAnchor.constraint(equalToConstant: 14.5),
                imageV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                imageV.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
            NSLayoutConstraint.activate(constrains)
        } else {
            self.addSubview(imageV)
            let constrains = [
                imageV.widthAnchor.constraint(equalToConstant: 30),
                imageV.heightAnchor.constraint(equalToConstant: 30),
                imageV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                imageV.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
            NSLayoutConstraint.activate(constrains)
        }
    }
    
    private func setupLayers() {
        if buttonName == .qr {
            self.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        } else {
            self.frame = CGRect(x: 0, y: 0, width: 71, height: 71)
        }
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width/2

        let shadows = UIView()
        shadows.frame = self.frame
        shadows.clipsToBounds = false
        self.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.15).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 20
        layer0.shadowOffset = CGSize(width: 0, height: 0)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shapes = UIView()
        shapes.frame = self.frame
        shapes.clipsToBounds = true
        self.addSubview(shapes)

        let layer1 = CALayer()
        if buttonName == .qr {
            layer1.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        } else {
            layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        }
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)
        self.toAutoLayout()
    }
    
    
}


