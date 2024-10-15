//
//  MoviesService.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation
import Alamofire

class MoviesRemoteRepositoryImpl: MoviesRemoteRepository {
    let GET_NOW_PLAYING_PATH = "/movie/now_playing"

    func getNowPlaying(language: String, page: Int, region: String?, completion: @escaping (RemoteResult<ListOfType<Movie>>) -> Void) {
        
        var parameter: Parameters  = [
            "language": language,
            "page": page
        ]
        
        if let unwpdRegion = region {
            parameter["region"] = unwpdRegion
        }
           
        AF.request(
            "\(BaseRemoteRepository.BASE_URL)\(GET_NOW_PLAYING_PATH)",
            method: .get,
            parameters: parameter,
            headers: BaseRemoteRepository.headers
        ).responseDecodable { (response: DataResponse<ListOfType<Movie>, AFError>) in
            print(response)
            switch response.result {
            case .success(let movies):
                print(movies)
                completion(RemoteResult.success(movies))
            case .failure(let error):
                completion(RemoteResult.error(ApiError(code: error.responseCode ?? 500 , errorString: error.errorDescription!)))
            }
        }
    }
}
