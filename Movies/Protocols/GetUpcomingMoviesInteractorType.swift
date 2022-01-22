//
//  GetUpcomingMoviesInteractorType.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import Foundation
import Combine

protocol GetUpcomingMoviesInteractorType {
    func getUpcomingMovies() -> AnyPublisher<GeneralResult, Error>
}
