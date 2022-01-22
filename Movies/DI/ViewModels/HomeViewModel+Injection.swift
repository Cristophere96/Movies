//
//  HomeViewModel+Injection.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Resolver

extension Resolver {
    typealias Dependencies = HomeViewModel.InputDependencies
    
    static func registerHomeDependencies() {
        registerViewModelDependencies()
        registerViewDependencies()
    }
    
    static func registerViewModelDependencies() {
        register {
            GetNowPlayingInteractor(moviesRepository: resolve(MoviesRepositoryType.self))
        }
        .implements(GetNowPlayingInteractorType.self)
        
        register {
            GetUpcomingMoviesInteractor(moviesRepository: resolve(MoviesRepositoryType.self))
        }
        .implements(GetUpcomingMoviesInteractorType.self)
        
        register {
            GetPopularMoviesInteractor(moviesRepository: resolve(MoviesRepositoryType.self))
        }
        .implements(GetPopularMoviesInteractorType.self)
    }
    
    static func registerViewDependencies() {
        register(HomeViewModel.self) { resolver in
            let dependencies = Dependencies(
                getNowPlayingInteractor: resolver.resolve(GetNowPlayingInteractorType.self),
                getUpcomingMoviesInteractor: resolver.resolve(GetUpcomingMoviesInteractorType.self),
                getPopularMoviesInteractor: resolver.resolve(GetPopularMoviesInteractorType.self)
            )
            
            return HomeViewModel(dependencies: dependencies)
        }
    }
}
