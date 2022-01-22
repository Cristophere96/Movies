//
//  GetPopularMoviesInteractor.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import Foundation
import Combine

final class GetPopularMoviesInteractor {
    private var moviesRepository: MoviesRepositoryType
    
    init(moviesRepository: MoviesRepositoryType) {
        self.moviesRepository = moviesRepository
    }
}

extension GetPopularMoviesInteractor: GetPopularMoviesInteractorType {
    func getPopular() -> AnyPublisher<GeneralResult, Error> {
        return moviesRepository.getUpcomingMovies()
    }
}
