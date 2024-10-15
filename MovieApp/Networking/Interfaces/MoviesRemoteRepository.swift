//
//  MoviesRemoteRepositoryInterface.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation

protocol MoviesRemoteRepository {
    func getNowPlaying(language: String, page: Int, region: String?, completion:  @escaping (RemoteResult<ListOfType<Movie>>) -> Void)
}

extension MoviesRemoteRepository {
    func getNowPlaying(language: String = "en-US", page: Int = 1, region: String? = nil, completionn:  @escaping (RemoteResult<ListOfType<Movie>>) -> Void) {
        getNowPlaying(language: language, page: page, region: region, completion: completionn)
    }
}
