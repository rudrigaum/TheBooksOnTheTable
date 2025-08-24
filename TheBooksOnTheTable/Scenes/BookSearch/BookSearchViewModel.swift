//
//  BookSearchViewModel.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 23/07/25.
//

import Foundation

class BookSearchViewModel {
    var onBooksUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    private(set) var books: [Book] = [] {
        didSet {
            onBooksUpdated?()
        }
    }

    func searchBooks(query: String) {
        guard !query.isEmpty else { return }

        APIManager.shared.searchBooks(query: query) { [weak self] result in
            switch result {
            case .success(let books):
                self?.books = books
            case .failure(let error):
                self?.onError?(error.localizedDescription) 
            }
        }
    }

    func getBook(at index: Int) -> Book {
        return books[index]
    }
}
