//
//  MoviesRepositoryImpl.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation
import Resolver

class MoviesRepositoryImpl: MoviesRepository {
    
    
    @Injected var getNowPlaying: GetNowPlaying
    
    func getNowPlaying(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void) {
        getNowPlaying.execute(completion: completion)
    }
    
    
}
