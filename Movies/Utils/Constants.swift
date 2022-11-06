//
//  Constants.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI

public struct Constants {
    enum URLs {
        static let baseURL: String = "https://api.themoviedb.org/3/"
        static let apiKey: String = "32d3f84e5f5f94880427c67ddb509893"
        static let baseImageURL: String = "https://image.tmdb.org/t/p/w500"
    }
    
    static let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
}
