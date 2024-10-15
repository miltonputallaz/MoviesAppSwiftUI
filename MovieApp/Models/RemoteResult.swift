//
//  RemoteResult.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation

enum RemoteResult<Response> where Response: Decodable {
    case success(Response)
    case error(ApiError)
}
