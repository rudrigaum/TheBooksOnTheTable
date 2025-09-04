//
//  HomeCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 0)
    }

    func start() {
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .white
        homeViewController.title = "featured books"
        
        self.navigationController.pushViewController(homeViewController, animated: false)
    }
}
