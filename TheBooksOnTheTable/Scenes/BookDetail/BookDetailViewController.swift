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
    
    init(viewModel: BookDetailViewModel, coordinator: BookDetailCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. This controller must be instantiated via dependency injection.")
    }


    let titleLabel = UILabel()
    let authorsLabel = UILabel()
    let descriptionTextView = UITextView()
    let coverImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        displayBookDetails()
    }

    private func setupUI() {
    }

    private func displayBookDetails() {
        titleLabel.text = viewModel.bookTitle
        authorsLabel.text = viewModel.bookAuthors
        descriptionTextView.text = viewModel.bookDescription
        if let imageUrl = viewModel.bookThumbnailURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.coverImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
