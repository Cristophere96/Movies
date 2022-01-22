//
//  HomeView.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI
import Resolver

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel = Resolver.resolve()
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("mainColor")))
                    .scaleEffect(2.0)
            } else {
                VStack(alignment: .leading) {
                    CustomNavBar()
                    
                    ScrollView(showsIndicators: false) {
                        Section(title: "In Theatres") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(viewModel.moviesNowPlaying, id: \.id) { movie in
                                        MovieCard(movie: movie)
                                    }
                                }
                            }
                        }
                        
                        Section(title: "Upcoming") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(viewModel.upcomingMovies, id: \.id) { movie in
                                        MovieCard(movie: movie)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 65)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
