//
//  BookDetailView.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation
import UIKit

class BookDetailView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let authorsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let infoStackView = UIStackView(arrangedSubviews: [coverImageView, titleLabel, authorsLabel])
        infoStackView.axis = .vertical
        infoStackView.alignment = .center
        infoStackView.spacing = 16
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(infoStackView)
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            infoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            coverImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(with viewModel: BookDetailViewModel) {
        titleLabel.text = viewModel.bookTitle
        authorsLabel.text = viewModel.bookAuthors
        descriptionTextView.text = viewModel.bookDescription
    }
}
