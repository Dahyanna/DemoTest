//
//  MovieViewModel.swift
//  DemoTest
//
//  Created by Dahyanna on 25-05-22.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    private var data: NetworkManagerProtocol
    private let didChange = PassthroughSubject<MovieViewModel, Never>()
    
    init(data: NetworkManagerProtocol = NetworkManager()) {
        self.data = data
        getPopularMovies()
        getTopRateMovies()
        getUpcommingMovies()
        getNowPlayingMovies()
    }
    
    @Published var popularMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var topRateMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var upcommingMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var nowPlayingMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func getTopRateMovies() {
        data.getDataApiMovieRate(movieType: .movieRate, completion: {
            self.topRateMovies = $0
        })
    }
    
    private func getPopularMovies() {
        data.getDataApiMoviePopular(movieType: .moviePopular, completion: {
            self.popularMovies = $0
        })
    }
    
    private func getNowPlayingMovies() {
        data.getDataApiMovieRate(movieType: .movieNowPlaying, completion: {
            self.nowPlayingMovies = $0
        })
    }
    
    private func getUpcommingMovies() {
        data.getDataApiMoviePopular(movieType: .movieUpcomming, completion: {
            self.upcommingMovies = $0
        })
    }
    
}
