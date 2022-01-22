//
//  NowPlaying.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation

struct GeneralResult: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct Dates: Codable {
    let maximum, minimum: String
}
