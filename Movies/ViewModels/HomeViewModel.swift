//
//  HomeViewModel.swift
//  Movies
//
//  Created by Cristopher Escorcia on 15/01/22.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var loading = false
    @Published var moviesNowPlaying = [Movie]()
    @Published var upcomingMovies = [Movie]()
    @Published var popularMovies = [Movie]()
    
    private var dependencies: InputDependencies
    private var cancellables = Set<AnyCancellable>()
    
    struct InputDependencies {
        var getNowPlayingInteractor: GetNowPlayingInteractorType
        var getUpcomingMoviesInteractor: GetUpcomingMoviesInteractorType
        var getPopularMoviesInteractor: GetPopularMoviesInteractorType
    }
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
}

extension HomeViewModel: NowPlayingViewModelType {
    func onAppear() {
        getInitialData()
    }
    func getInitialData() {
        updateState {
            self.loading = true
        }
        
        let nowPlayingPublisher = self.dependencies
            .getNowPlayingInteractor
            .getNowPlaying()
        
        let upcomingMoviesPublisher = self.dependencies
            .getUpcomingMoviesInteractor
            .getUpcomingMovies()
        
        let popularMoviesPublisher = self.dependencies
            .getPopularMoviesInteractor
            .getPopular()
        
        Publishers.Zip3(nowPlayingPublisher, upcomingMoviesPublisher, popularMoviesPublisher)
            .sink { [weak self] errorResult in
                guard case .failure(let error) = errorResult else { return }
                print(error)
                self?.updateState {
                    self?.loading = false
                }
            } receiveValue: { [weak self] nowPlaying, upcoming, popular in
                self?.updateState {
                    self?.moviesNowPlaying = nowPlaying.results
                    self?.upcomingMovies = upcoming.results
                    self?.popularMovies = popular.results
                    self?.loading = false
                }
            }
            .store(in: &cancellables)
    }
}

extension HomeViewModel {
    private func updateState(updater: () -> Void) {
        updater()
        objectWillChange.send()
    }
}
