//
//  LocalResult.swift
//  MovieApp
//
//  Created by Milton Putallaz on 08/10/2024.
//

import Foundation

enum LocalResult<Response, CustomError> where Response: Decodable, CustomError: LocalizedError {
    case emptySuccess
    case success(Response)
    case error(CustomError)
}
