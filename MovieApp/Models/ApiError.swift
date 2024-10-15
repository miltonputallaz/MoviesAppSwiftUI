//
//  Error.swift
//  MovieApp
//
//  Created by Milton Putallaz on 07/10/2024.
//

import Foundation

class ApiError {
    let code: Int
    let errorString: String
    
    init(code: Int, errorString: String) {
        self.code = code
        self.errorString = errorString
    }
}
