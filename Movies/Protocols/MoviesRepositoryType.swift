//
//  MoviesRepositoryType.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation
import Combine

protocol MoviesRepositoryType {
    func getNowPlaying() -> AnyPublisher<GeneralResult, Error>
    
    func getUpcomingMovies() -> AnyPublisher<GeneralResult, Error>
    
    func getPopulars() -> AnyPublisher<GeneralResult, Error>
}
