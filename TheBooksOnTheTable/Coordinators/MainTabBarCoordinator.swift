//
//  MainTabBarCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class MainTabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = UITabBarController()
        
        let bookSearchNavigationController = UINavigationController()
        let favoritesNavigationController = UINavigationController()
        
        let bookSearchCoordinator = BookSearchCoordinator(navigationController: bookSearchNavigationController)
        let favoritesCoordinator = FavoritesCoordinator(navigationController: favoritesNavigationController)
        
        childCoordinators = [bookSearchCoordinator, favoritesCoordinator]
        
        bookSearchCoordinator.start()
        favoritesCoordinator.start()
        
        tabBarController.viewControllers = [bookSearchNavigationController, favoritesNavigationController]
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([tabBarController], animated: false)
    }
}
