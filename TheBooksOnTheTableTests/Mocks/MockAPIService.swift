//
//  MockAPIService.swift
//  TheBooksOnTheTableTests
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import Foundation
@testable import TheBooksOnTheTable

class MockAPIService: APIService {
    
    var searchResult: Result<[Book], APIError>?
    var receivedQuery: String?
    
    func searchBooks(query: String, completion: @escaping (Result<[Book], APIError>) -> Void) {
        receivedQuery = query
        if let result = searchResult {
            completion(result)
        }
    }
}
