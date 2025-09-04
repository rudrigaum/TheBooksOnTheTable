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
        tabBarController.view.backgroundColor = .systemBackground

        let homeNavController = setupHomeFlow()
        let bookSearchNavController = setupBookSearchFlow()
        let favoritesNavController = setupFavoritesFlow()

        tabBarController.viewControllers = [
            homeNavController,
            bookSearchNavController,
            favoritesNavController
        ]

        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([tabBarController], animated: true)
    }

    private func setupHomeFlow() -> UINavigationController {
        let navController = UINavigationController()
        let coordinator = HomeCoordinator(navigationController: navController)
        childCoordinators.append(coordinator)
        coordinator.start()
        return navController
    }

    private func setupBookSearchFlow() -> UINavigationController {
        let navController = UINavigationController()
        let coordinator = BookSearchCoordinator(navigationController: navController)
        childCoordinators.append(coordinator)
        coordinator.start()
        return navController
    }

    private func setupFavoritesFlow() -> UINavigationController {
        let navController = UINavigationController()
        let coordinator = FavoritesCoordinator(navigationController: navController)
        childCoordinators.append(coordinator)
        coordinator.start()
        return navController
    }
}
