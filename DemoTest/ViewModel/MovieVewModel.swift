//
//  MovieViewModel.swift
//  DemoTest
//
//  Created by Dahyanna on 25-05-22.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    var data: NetworkManagerProtocol
    let didChange = PassthroughSubject<MovieViewModel, Never>()
    
    init(data: NetworkManagerProtocol) {
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
    
    func getTopRateMovies() {
        data.getDataApiMovieRate(movieType: .movieRate, completion: {
            self.topRateMovies = $0
        })
    }
    
    func getPopularMovies() {
        data.getDataApiMoviePopular(movieType: .moviePopular, completion: {
            self.popularMovies = $0
        })
    }
    
    func getNowPlayingMovies() {
        data.getDataApiMovieRate(movieType: .movieNowPlaying, completion: {
            self.nowPlayingMovies = $0
        })
    }
    
    func getUpcommingMovies() {
        data.getDataApiMoviePopular(movieType: .movieUpcomming, completion: {
            self.upcommingMovies = $0
        })
    }
    
}
