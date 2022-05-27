//
//  MovieDetailsViewModel.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import Foundation
import Combine

class MovieDetailsViewModel: ObservableObject {
    private var data: NetworkManagerDetailsMovieProtocol
    @Published var idmovie: Int = .zero{
        didSet{
            getListImagesMovies()
            getDetailsMovies()
        }
    }
    let didChange = PassthroughSubject<MovieDetailsViewModel, Never>()
    
    init(data: NetworkManagerDetailsMovieProtocol = NetworkManagerDetailsMovie()) {
        self.data = data
    }
    
    @Published var imagesMovies = [Backdrop]() {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var detailsMovie: DetailsMovie? {
        didSet {
            didChange.send(self)
        }
    }
    
    private func getListImagesMovies() {
        data.getDataApiListImagesMovie(idMovie: self.idmovie, completion: {
            self.imagesMovies = $0
        })
    }
    
    private func getDetailsMovies() {
        data.getDataApiDetailsMovie(idMovie: self.idmovie, completion: {
            self.detailsMovie = $0
        })
    }
}

