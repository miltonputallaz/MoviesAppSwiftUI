//
//  MoviesLocalRepository.swift
//  MovieApp
//
//  Created by Milton Putallaz on 08/10/2024.
//

import Foundation

protocol MoviesLocalRepository {
    func save(movies: [Movie], completion: @escaping (LocalResult<[Movie], MoviesErrors>) -> Void) 
}
