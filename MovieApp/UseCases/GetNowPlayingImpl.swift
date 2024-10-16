//
//  GetNowPlayingTimestamp.swift
//  MovieApp
//
//  Created by Milton Putallaz on 16/10/2024.
//

import Foundation
import Resolver

struct GetNowPlayingImpl: GetNowPlaying {
    @Injected var moviesRemoteRepository: MoviesRemoteRepository
    @Injected var moviesLocalRepository: MoviesLocalRepository
    @Injected var userDefaults: UserDefaults
    
    func execute(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void) {
        if let lastGetNowPlayingTimestamp = userDefaults.object(forKey: UserDefaultKeys.now_playing_timestamp) as? Date {
            if (lastGetNowPlayingTimestamp.addingTimeInterval(TimeRanges.six_hours_in_seconds) < Date.now) {
                getNowPlaying(completion: completion)
            } else {
                completion(.timeRequestError)
            }
        } else {
            getNowPlaying(completion: completion)
        }
    }
    
    private func getNowPlaying(completion:  @escaping (LocalResult<ListOfType<Movie>, MoviesErrors>) -> Void) {
        moviesRemoteRepository.getNowPlaying(region: nil) { result in
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
                    case .timeRequestError:
                        completion(.timeRequestError)
                    }
                }
            case .error:
                completion(LocalResult.error(MoviesErrors.emptyMovies))
            }
        }
    }
}
