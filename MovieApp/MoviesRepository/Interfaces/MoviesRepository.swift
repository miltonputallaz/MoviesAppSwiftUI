//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation

protocol MoviesRepository {
    func getNowPlaying(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void)
}
