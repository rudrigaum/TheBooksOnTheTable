//
//  Book.swift
//  TheBooksOnTheTable
//
//  Created by Rodrigo Cerqueira Reis on 23/07/25.
//

import Foundation

struct Book: Codable, Identifiable {
    let id: String?
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let description: String?
    let imageLinks: ImageLinks?
  
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
