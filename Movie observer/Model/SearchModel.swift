//
//  SearchModel.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 08.06.2021.

import Foundation

// MARK: - SearchModels
struct SearchModels: Codable {
    let search: [Search]
    let totalResults: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie
    case series
    case game
}

