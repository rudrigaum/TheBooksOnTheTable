//
//  APIManager.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 23/07/25.
//

import Foundation

class APIManager: APIService {
    private let baseURL = "https://www.googleapis.com/books/v1/"
    private let apiKey = APIKeys.googleAPIKey

    func searchBooks(query: String, completion: @escaping (Result<[Book], APIError>) -> Void) {
        print("API Key being used: \(apiKey)")
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)volumes?q=\(encodedQuery)&key=\(apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let errorMessage = data.flatMap { String(data: $0, encoding: .utf8) }
                print("API Error: Status Code \(statusCode), Message: \(errorMessage ?? "No message")")
                completion(.failure(.apiFailed(statusCode: statusCode, message: errorMessage)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(BooksAPIResponse.self, from: data)
                completion(.success(decodedResponse.items ?? []))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}

