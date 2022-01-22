//
//  App+Injection.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerHomeDependencies()
        registerMoviesRepository()
    }    
}
