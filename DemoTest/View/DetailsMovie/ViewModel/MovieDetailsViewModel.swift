//
//  MovieDetailsViewModel.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import Foundation
import Combine

class MovieDetailsViewModel: ObservableObject {
    var data: NetworkManagerDetailsMovieProtocol
    var idmovie: Int
    let didChange = PassthroughSubject<MovieDetailsViewModel, Never>()
    
    init(data: NetworkManagerDetailsMovieProtocol, id: Int) {
        self.data = data
        self.idmovie = id
        getListImagesMovies()
        getDetailsMovies()
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
    
    func getListImagesMovies() {
        data.getDataApiListImagesMovie(idMovie: self.idmovie, completion: {
            self.imagesMovies = $0
        })
    }
    
    func getDetailsMovies() {
        data.getDataApiDetailsMovie(idMovie: self.idmovie, completion: {
            self.detailsMovie = $0
        })
    }
}

