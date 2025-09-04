//
//  BookDetailViewModel.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 31/07/25.
//

import Foundation

class BookDetailViewModel {
    let book: Book

    init(book: Book) {
        self.book = book
    }
    
    var bookTitle: String? { return book.volumeInfo?.title }
    var bookAuthors: String? { return book.volumeInfo?.authors?.joined(separator: ", ") }
    var bookDescription: String? { return book.volumeInfo?.description }
    var bookThumbnailURL: URL? {
        if let urlString = book.volumeInfo?.imageLinks?.thumbnail {
            return URL(string: urlString)
        }
        return nil
    }
}
