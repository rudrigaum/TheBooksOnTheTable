//
//  AppCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 23/07/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

protocol BookDetailNavigation: AnyObject {
    func navigateToBookDetail(book: Book)
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainTabBarCoordinator = MainTabBarCoordinator(navigationController: navigationController)
        childCoordinators = [mainTabBarCoordinator]
        mainTabBarCoordinator.start()
    }
}
