//
//  MoviesRepositoryImpl.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation
import Resolver

class MoviesRepositoryImpl: MoviesRepository {
    
    
    @Injected var moviesRemoteRepository: MoviesRemoteRepository
    @Injected var moviesLocalRepository: MoviesLocalRepository
    
    func getNowPlaying(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void) {
        moviesRemoteRepository.getNowPlaying(region: nil) { result in
            print(result)
            switch result {
            case .success(let moviesList):
                self.moviesLocalRepository.save(movies: moviesList.results) { savingResult in
                    switch savingResult {
                    case .emptySuccess:
                        completion(LocalResult.emptySuccess)
                    case .success(_):
                        print("Success")
                    case .error(let savingError):
                        completion(LocalResult.error(savingError))
                    }
                }
            case .error:
                completion(LocalResult.error(MoviesErrors.emptyMovies))
            }
        }
    }
    
    
}
