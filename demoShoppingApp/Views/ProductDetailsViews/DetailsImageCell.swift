//
//  DetailsImageCell.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 06.01.2023.
//

import UIKit


class DetailImageCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(image)
        
        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

