//
//  NetworkDetailsStub.swift
//  DemoTestTests
//
//  Created by Dahyanna on 26-05-22.
//

import XCTest
@testable import DemoTest
class NetworkDetailsStub: NetworkManagerDetailsMovieProtocol {
    
    var gallery: [Backdrop] = []
    var details: DetailsMovie?
    
    
    func getDataApiListImagesMovie(idMovie: Int, completion: @escaping ([Backdrop]) -> ()) {
        completion(gallery)
    }
    
    func getDataApiDetailsMovie(idMovie: Int, completion: @escaping (DetailsMovie) -> ()) {
        completion(details!)
    }
}
