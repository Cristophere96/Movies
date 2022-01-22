//
//  NowPlayingRepository.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI
import Combine

final class MoviesRepository {
    private var networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
}

extension MoviesRepository : MoviesRepositoryType {
    func getNowPlaying() -> AnyPublisher<GeneralResult, Error> {
        let endpoint = APIRequest<GeneralResult>(relativePath: "movie/now_playing")
        
        return networkService.request(endpoint, queue: .main)
    }
    
    func getUpcomingMovies() -> AnyPublisher<GeneralResult, Error> {
        let endpoint = APIRequest<GeneralResult>(relativePath: "movie/upcoming")
        
        return networkService.request(endpoint, queue: .main)
    }
    
    func getPopulars() -> AnyPublisher<GeneralResult, Error> {
        let endpoint = APIRequest<GeneralResult>(relativePath: "movie/popular")
        
        return networkService.request(endpoint, queue: .main)
    }
}
