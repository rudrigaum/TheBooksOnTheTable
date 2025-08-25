//
//  APIError.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 25/08/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    case networkError(Error)
    case apiFailed(statusCode: Int, message: String?)
}
