//
//  Movie.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation
import SwiftData

@Model
final class Movie: Decodable, Identifiable {
    var adult: Bool
    var backdropPath: String
    var genreIDS: [Int]
    @Attribute(.unique) var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    
    init(adult: Bool, backdropPath: String, genreIDS: [Int], id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    // Inicializador requerido para Decodable
    required init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         adult = try container.decode(Bool.self, forKey: .adult)
         backdropPath = try container.decode(String.self, forKey: .backdropPath)
         genreIDS = try container.decode([Int].self, forKey: .genreIDS)
         id = try container.decode(Int.self, forKey: .id)
         originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
         originalTitle = try container.decode(String.self, forKey: .originalTitle)
         overview = try container.decode(String.self, forKey: .overview)
         popularity = try container.decode(Double.self, forKey: .popularity)
         posterPath = try container.decode(String.self, forKey: .posterPath)
         releaseDate = try container.decode(String.self, forKey: .releaseDate)
         title = try container.decode(String.self, forKey: .title)
         video = try container.decode(Bool.self, forKey: .video)
         voteAverage = try container.decode(Double.self, forKey: .voteAverage)
         voteCount = try container.decode(Int.self, forKey: .voteCount)
     }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
