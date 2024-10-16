//
//  RequestInterceptor.swift
//  MovieApp
//
//  Created by Milton Putallaz on 16/10/2024.
//

import Foundation
import Alamofire

class ApiRequestInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        print("URL -> \(urlRequest)")
        completion(.success(urlRequest))
    }
}
