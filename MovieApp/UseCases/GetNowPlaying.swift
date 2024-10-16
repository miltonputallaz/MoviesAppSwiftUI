//
//  GetNowPlaying.swift
//  MovieApp
//
//  Created by Milton Putallaz on 16/10/2024.
//

import Foundation

protocol GetNowPlaying {
    func execute(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void)
}
