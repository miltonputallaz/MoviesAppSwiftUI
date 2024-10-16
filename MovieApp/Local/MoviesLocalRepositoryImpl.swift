//
//  MoviesLocalRepositoryImpl.swift
//  MovieApp
//
//  Created by Milton Putallaz on 08/10/2024.
//

import Foundation
import Resolver

class MoviesLocalRepositoryImpl: MoviesLocalRepository {
    @Injected var baseLocalRepository: BaseLocalRepository
    
    func save(movies: [Movie], completion: @escaping (LocalResult<[Movie], MoviesErrors>) -> Void) {
        do {
            try baseLocalRepository.containerContext!.transaction {
                for movie in movies {
                    baseLocalRepository.containerContext!.insert(movie)
                }
                try baseLocalRepository.containerContext!.save()
            }
        } catch {
            
        }
        
    }
    
    
}
