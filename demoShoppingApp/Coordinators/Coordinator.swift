//
//  Coordinator.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 21.12.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
    var navigation: UINavigationController { get set }
}
