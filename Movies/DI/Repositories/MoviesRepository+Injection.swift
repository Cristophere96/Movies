//
//  MoviesRepository+Injection.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Resolver

extension Resolver {
    public static func registerMoviesRepository() {
        register {
            NetworkService()
        }
        .implements(NetworkServiceType.self)
        
        register {
            MoviesRepository(networkService: resolve(NetworkServiceType.self))
        }
        .implements(MoviesRepositoryType.self)
    }
}
