//
//  MovieDetailsModel.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import Foundation

// MARK: - ImagesMovie
struct ImagesMovie: Codable {
    let posters: [Backdrop]
}

// MARK: - Backdrop
struct Backdrop: Codable, Hashable, Identifiable {
    let id = UUID()
    let filePath: String
    let voteAverage: Double
    let voteCount, width: Int

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case width
    }
}


// MARK: - DetailsMovie
struct DetailsMovie: Codable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var listGenres: String {
        var value = "Genre: "
        genres.forEach() { val in
            value += (" / \(val.name) ")
        }
        return value
    }
    
    var releaseDateText: String {
        return String(format: MoviesDetailsConstant.textViewDetails.dateAvaluable, releaseDate)
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int
    let logoPath, name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
