//
//  BookDetailViewController.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 31/07/25.
//

import Foundation
import UIKit

class BookDetailViewController: UIViewController {
    private let viewModel: BookDetailViewModel
    private weak var coordinator: BookDetailCoordinator?
    private let bookDetailView = BookDetailView()
    
    init(viewModel: BookDetailViewModel, coordinator: BookDetailCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. This controller must be instantiated via dependency injection.")
    }

    override func loadView() {
        self.view = bookDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayBookDetails()
    }

    private func setupUI() {
    }

    private func displayBookDetails() {
        bookDetailView.configure(with: viewModel)
        
        if let imageUrl = viewModel.bookThumbnailURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.bookDetailView.coverImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
