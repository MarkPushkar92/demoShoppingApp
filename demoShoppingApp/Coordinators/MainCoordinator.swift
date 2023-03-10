//
//  MainViewControllerCoordinator.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    var navigation: UINavigationController
 
    init(navigation: UINavigationController) {
        self.navigation = navigation
  
    }
 
    func start() {
        let mainVC = MainViewController()
        mainVC.coordinator = self
        navigation.pushViewController(mainVC, animated: true)
    }
    
    func gotoBusket() {
        let vc = BasketController()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
    func gotoFaves() {
        let vc = FavesViewController()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
    func gotoDetails() {
        let vc = DetailsViewController()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
    
}
