//
//  FavoritesCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class FavoritesCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.tabBarItem = UITabBarItem(title: "favorites", image: UIImage(systemName: "heart.fill"), tag: 1)
    }

    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
