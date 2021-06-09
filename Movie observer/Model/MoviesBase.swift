//
//  MoviesBase.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 03.06.2021.
//

//import Foundation
//
//class MoviesBase {
//
//    static let shared = MoviesBase()
//    var moviesData = [MovieModel]()
//
//    let defaults = UserDefaults.standard
//
//    struct MovieBase: Codable {
//        var moviesName: String
//    }
//
//    var movieArray: [MovieBase] {
//        get {
//            if let data = defaults.value(forKey: "moviesName") as? Data {
//                return try! PropertyListDecoder().decode([MovieBase].self, from: data)
//            } else {
//                return [MovieBase]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue) {
//            defaults.set(data, forKey: "moviesName")
//            }
//        }
//    }
//
//    func save() {
//        defaults.setValue(MOVIES_ARRAY, forKey: "MoviesArray")
//    }
//
//    func saveMovieToBase(title: String) {
//        let movieTitle = MovieBase(moviesName: title)
//        movieArray.append(movieTitle)
//    }
//
//    func getMovieBase() -> [MovieBase] {
//        for i in MOVIES_ARRAY {
//            saveMovieToBase(title: i)
//        }
//        return movieArray
//    }
//}
//
//
