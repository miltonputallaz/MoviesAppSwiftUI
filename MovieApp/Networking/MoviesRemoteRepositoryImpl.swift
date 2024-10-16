//
//  MoviesService.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation
import Alamofire
import Resolver

class MoviesRemoteRepositoryImpl: MoviesRemoteRepository {
    @Injected var userDefaults: UserDefaults
    @Injected var interceptor: ApiRequestInterceptor
    
    
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
            headers: BaseRemoteRepository.headers,
            interceptor: interceptor
        ).responseDecodable { (response: DataResponse<ListOfType<Movie>, AFError>) in
            print(response)
            switch response.result {
            case .success(let movies):
                self.userDefaults.set(Date.now, forKey: UserDefaultKeys.now_playing_timestamp)
                completion(RemoteResult.success(movies))
            case .failure(let error):
                completion(RemoteResult.error(ApiError(code: error.responseCode ?? 500 , errorString: error.errorDescription!)))
            }
        }
    }
}
