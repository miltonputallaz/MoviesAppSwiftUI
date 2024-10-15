//
//  MoviesLocalRepositoryImpl.swift
//  MovieApp
//
//  Created by Milton Putallaz on 08/10/2024.
//

import Foundation
import SwiftUI
import Resolver

class MoviesLocalRepositoryImpl: MoviesLocalRepository {
    @Injected var baseLocalRepository: BaseLocalRepository
    
    @Environment(\.modelContext) private var modelContext
    
    func save(movies: [Movie], completion: @escaping (LocalResult<[Movie], MoviesErrors>) -> Void) {
        do {
            try modelContext.transaction {
                for movie in movies {
                    baseLocalRepository.containerContext!.insert(movie)
                }
                try baseLocalRepository.containerContext!.save()
            }
        } catch {
            
        }
        
    }
    
    
}
