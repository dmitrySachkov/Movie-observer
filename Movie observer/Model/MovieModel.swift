//
//  MovieModel.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 05.06.2021.
//



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModels = try? newJSONDecoder().decode(DataModels.self, from: jsonData)

import Foundation

// MARK: - DataModels
struct MovieModel: Codable {
    
    let title: String
    let year: String
    let rated: String
    let released: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    let metascore: String
    let imdbRating: String
    let type: String
    let runtime: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating
        case type = "Type"
    }
}

