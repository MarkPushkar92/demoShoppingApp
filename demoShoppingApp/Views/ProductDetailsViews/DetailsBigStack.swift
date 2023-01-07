//
//  DetailsBigStack.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 07.01.2023.
//

import UIKit

class DetailsStackView: UIStackView {
    
    private let cpuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "CPU")
        return imageView
    }()
    
    private let sdImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "SD")
        return imageView
    }()
    
    private let sSDImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "ssd")
        return imageView
    }()
    
    private let cameraImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "camera")
        return imageView
    }()
    
    let cpuLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    let sdLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    let ssdLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    let cameraLabel: UILabel = {
        var view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 64, height: 14)
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        view.font = UIFont(name: "MarkPro", size: 11)
        view.text = "Exynos 990"
        view.toAutoLayout()
        return view
    }()
    
    private let cpuStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 5
        return stack
    }()
    
    private let cameraStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 5
        return stack
    }()
    
    private let ssdStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 5
        return stack
    }()
    
    private let sdStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 5
        return stack
    }()
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupViews()
        self.toAutoLayout()
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .equalCentering
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        [cpuStack, cameraStack, ssdStack, sdStack].forEach {
            addArrangedSubview($0)
        }
        
        cpuStack.addArrangedSubview(cpuImage)
        cpuStack.addArrangedSubview(cpuLabel)
        
        cameraStack.addArrangedSubview(cameraImage)
        cameraStack.addArrangedSubview(cameraLabel)
        
        ssdStack.addArrangedSubview(sSDImage)
        ssdStack.addArrangedSubview(ssdLabel)
        
        sdStack.addArrangedSubview(sdImage)
        sdStack.addArrangedSubview(sdLabel)

    }
    
}
