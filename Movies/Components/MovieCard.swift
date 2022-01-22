//
//  MovieCard.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI

struct MovieCard: View {
    var movie: Movie
    
    var body: some View {
        NavigationLink {
            Text(movie.title)
        } label: {
            MoviesPosterImage(posterPath: movie.posterPath)
        }

    }
}
