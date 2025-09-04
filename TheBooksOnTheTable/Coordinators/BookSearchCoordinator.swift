//
//  BookSearchCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 23/07/25.
//

import Foundation
import UIKit

class BookSearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.tabBarItem = UITabBarItem(title: "search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
    }

    func start() {
        let viewModel = BookSearchViewModel(apiService: APIManager())
        let viewController = BookSearchViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    func navigateToBookDetail(book: Book) {
        let bookDetailCoordinator = BookDetailCoordinator(navigationController: navigationController, book: book)
        childCoordinators.append(bookDetailCoordinator)
        bookDetailCoordinator.start()
    }
}
