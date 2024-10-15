//
//  App+Injection.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
      register { MainViewModel() }.scope(.container)
      
      //Singletons
      register { MoviesRepositoryImpl() }.scope(.application).implements(MoviesRepository.self)
      register { MoviesRemoteRepositoryImpl() }.scope(.application).implements(MoviesRemoteRepository.self)
      register { MoviesLocalRepositoryImpl() }.scope(.application).implements(MoviesLocalRepository.self)
      register { BaseLocalRepository() }.scope(.application)
  }
}

