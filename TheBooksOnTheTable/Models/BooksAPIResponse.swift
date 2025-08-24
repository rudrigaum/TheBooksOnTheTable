//
//  BooksAPIResponse.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import Foundation

struct BooksAPIResponse: Codable {
    let items: [Book]?
    let totalItems: Int?
}
