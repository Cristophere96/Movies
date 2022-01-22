//
//  GetUpcomingMoviesInteractor.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import Foundation
import Combine

final class GetUpcomingMoviesInteractor {
    private var moviesRepository: MoviesRepositoryType
    
    init(moviesRepository: MoviesRepositoryType) {
        self.moviesRepository = moviesRepository
    }
}

extension GetUpcomingMoviesInteractor: GetUpcomingMoviesInteractorType {
    func getUpcomingMovies() -> AnyPublisher<GeneralResult, Error> {
        return moviesRepository.getUpcomingMovies()
    }
}
