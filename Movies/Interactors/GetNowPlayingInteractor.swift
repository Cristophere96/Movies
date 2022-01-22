//
//  GetNowPlayingInteractor.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Foundation
import Combine

final class GetNowPlayingInteractor {
    private var moviesRepository: MoviesRepositoryType
    
    init(moviesRepository: MoviesRepositoryType) {
        self.moviesRepository = moviesRepository
    }
}

extension GetNowPlayingInteractor: GetNowPlayingInteractorType {
    func getNowPlaying() -> AnyPublisher<GeneralResult, Error> {
        return moviesRepository.getNowPlaying()
    }
}
