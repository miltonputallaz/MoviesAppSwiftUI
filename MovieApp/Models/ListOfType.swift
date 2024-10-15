//
//  ListOfType.swift
//  MovieApp
//
//  Created by Milton Putallaz on 06/10/2024.
//

import Foundation

struct ListOfType<T>: Decodable where T: Decodable{
    let results: [T]
    let page: Int?
    let dates: Dates?
    
    init(results: [T], page: Int? = nil, dates: Dates? = nil) {
        self.results = results
        self.page = page
        self.dates = dates
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case dates = "dates"
    }
}
