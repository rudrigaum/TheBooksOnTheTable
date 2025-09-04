//
//  BookDetailCoordinator.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 31/07/25.
//

import Foundation
import UIKit

class BookDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let book: Book

    init(navigationController: UINavigationController, book: Book) {
        self.navigationController = navigationController
        self.book = book
    }

    func start() {
        let viewModel = BookDetailViewModel(book: self.book)
        let viewController = BookDetailViewController(viewModel: viewModel, coordinator: self)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
