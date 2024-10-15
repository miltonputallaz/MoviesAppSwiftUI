//
//  BaseRemoteRepository.swift
//  MovieApp
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation
import Alamofire

struct BaseRemoteRepository {
    static let BASE_URL: String = "https://api.themoviedb.org/3"
    
    static let headers: HTTPHeaders = [
        "Authorization": "Bearer \((Bundle.main.object(forInfoDictionaryKey: "API_READ_ACCESS_TOKEN") as! String))",
        "Accept": "application/json"
    ]
}
