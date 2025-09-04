//
//  APIService.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import Foundation

protocol APIService {
    func searchBooks(query: String, completion: @escaping (Result<[Book], APIError>) -> Void)
}
