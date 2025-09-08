//
//  HomeViewModel.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 04/09/25.
//

import Foundation

class HomeViewModel {
    
    var featuredBooks: [Book] = []
    
    func fetchFeaturedBooks() {
        self.featuredBooks = createMockBooks()
    }
    
    private func createMockBooks() -> [Book] {
        let mockBooks: [Book] = [
            Book(id: "1",
                 volumeInfo: VolumeInfo(
                     title: "The Swift Programming Language",
                     authors: ["Apple Inc."],
                     publishedDate: "2023-01-01",
                     description: "The official guide to the Swift programming language.",
                     imageLinks: ImageLinks(
                         smallThumbnail: "https://books.google.com/books/content?id=ziw3EAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                         thumbnail: "https://books.google.com/books/content?id=ziw3EAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
                     )
                 )
            ),
            
            Book(id: "2",
                 volumeInfo: VolumeInfo(
                     title: "Clean Architecture",
                     authors: ["Robert C. Martin"],
                     publishedDate: "2017-09-21",
                     description: "A classic book on software architecture.",
                     imageLinks: ImageLinks(
                         smallThumbnail: "https://books.google.com/books/content?id=W9B_p-uM2dkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                         thumbnail: "https://books.google.com/books/content?id=W9B_p-uM2dkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
                     )
                 )
            ),
            
            Book(id: "3",
                 volumeInfo: VolumeInfo(
                     title: "The Lord of the Rings",
                     authors: ["J.R.R. Tolkien"],
                     publishedDate: "1954-07-29",
                     description: "An epic high-fantasy novel.",
                     imageLinks: ImageLinks(
                         smallThumbnail: "https://books.google.com/books/content?id=HnS8XqYtYJwC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                         thumbnail: "https://books.google.com/books/content?id=HnS8XqYtYJwC&printsec=frontcover&img=1&zoom=1&source=gbs_api"
                     )
                 )
            ),
            
            Book(id: "4",
                 volumeInfo: VolumeInfo(
                     title: "Dune",
                     authors: ["Frank Herbert"],
                     publishedDate: "1965-08-01",
                     description: "The original science fiction epic.",
                     imageLinks: ImageLinks(
                         smallThumbnail: "https://books.google.com/books/content?id=B1l_v35rM1EC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                         thumbnail: "https://books.google.com/books/content?id=B1l_v35rM1EC&printsec=frontcover&img=1&zoom=1&source=gbs_api"
                     )
                 )
            )
        ]
        return mockBooks
    }
}
