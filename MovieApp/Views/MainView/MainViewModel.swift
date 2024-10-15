//
//  MainPresenterImpl.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation
import Resolver
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Injected var moviesRepository: MoviesRepository
    
    @Published private(set) var moviesList: [Movie] = []
    @Published var showError: Bool = false
    private(set) var errorMessage: MoviesErrors? = nil
    
    
    func getNowPlaying () {
        moviesRepository.getNowPlaying { result in
            print(result)
            switch result {
            case .success(let movies):
                print("Movies \(self.moviesList)")
            case .error(let error):
                print("Edsa")
                self.errorMessage = error
                self.showError = true
            default:
                print("")
            }
        }
    }
    
    
}
