//
//  MainViewControllerCoordinator.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainViewControllerCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
   
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
        
    }
    
    func start() {
        let mainVC = MainViewController()
        mainVC.coordinator = self
        navigation.pushViewController(mainVC, animated: true)
    }
    
    
}
