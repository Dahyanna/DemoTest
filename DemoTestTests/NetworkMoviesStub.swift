//
//  NetworkMoviesStub.swift
//  DemoTestTests
//
//  Created by Dahyanna on 26-05-22.
//

import XCTest
@testable import DemoTest
class NetworkMoviesStub: NetworkManagerProtocol {
    var movie: [Movie] = []
    
    func getDataApiMovieRate(movieType: NetworkManagerConstant, completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
    
    func getDataApiMoviePopular(movieType: NetworkManagerConstant, completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
    
    func getDataApiMovieNowPlaying(movieType: NetworkManagerConstant, completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
    
    func getDataApiMovieUpcomming(movieType: NetworkManagerConstant, completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
}
