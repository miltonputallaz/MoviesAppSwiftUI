//
//  MoviesErrors.swift
//  MovieApp
//
//  Created by Milton Putallaz on 08/10/2024.
//

import Foundation

enum MoviesErrors: LocalizedError {
    case emptyMovies // invalidUserName etc
         
        var errorDescription: String? {
            switch self {
            case .emptyMovies:
                return "Error getting movies"
            }
        }
         
        var failureReason: String? {
            switch self {
            case .emptyMovies:
                return "Some problem happens"
            }
        }
         
        var recoverySuggestion: String? {
            switch self {
            case .emptyMovies:
                return "Please try again refreshing list"
            }
        }
}
