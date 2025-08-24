//
//  APIKeys.swift.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 24/08/25.
//

import Foundation

enum APIKeys {
    static let googleAPIKey: String = {
        guard let key = Bundle.main.infoDictionary?["API_Key_Config"] as? String else {
            fatalError("API_Key_Config not found in Info.plist. Check your .xcconfig setup.")
        }
        return key
    }()
}
