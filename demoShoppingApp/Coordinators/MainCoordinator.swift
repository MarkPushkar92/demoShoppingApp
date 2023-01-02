//
//  MainCoordinator.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let tabBarController: TabBarController

    
    init() {
        tabBarController = TabBarController()
        let main = configureFeed()
        coordinators.append(main)
        tabBarController.viewControllers = [main.navigation]
        main.start()
    }
    
    private func configureFeed() -> MainViewControllerCoordinator {
        let navigationFirst = UINavigationController()
        navigationFirst.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(systemName: "house.fill"), tag: 0)
        let coordinator = MainViewControllerCoordinator(navigation: navigationFirst)
        return coordinator
    }
    
    
}
