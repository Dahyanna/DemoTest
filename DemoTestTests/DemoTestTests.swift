//
//  DemoTestTests.swift
//  DemoTestTests
//
//  Created by Dahyanna on 25-05-22.
//

import XCTest
@testable import DemoTest

class DemoTestTests: XCTestCase {

    let dataMock: [Movie] = [.init(id: 12, adult: false, backdropPath: "none", genreIDS: [9,7,6,5], originalLanguage: "none", originalTitle: "none", overview: "none", popularity: 123213.3123, posterPath: "none", releaseDate: "none", title: "none", video: false, voteAverage: 12321.122, voteCount: 1231232132), .init(id: 13, adult: false, backdropPath: "none", genreIDS: [9,7,6,5], originalLanguage: "none", originalTitle: "none", overview: "none", popularity: 123213.3123, posterPath: "none", releaseDate: "none", title: "none", video: false, voteAverage: 12321.122, voteCount: 1231232132)]
    
    var modelList: MovieViewModel!
    var data: NetworkMoviesStub!
    
    override func setUpWithError() throws {
        data = NetworkMoviesStub()
        modelList = MovieViewModel(data: data)
    }

    override func tearDownWithError() throws {
        modelList = nil
    }
    
    func testWhenExternalDataGiveUsTwoObjectsToprateMovies(){
        data.movie = dataMock
        
        modelList = MovieViewModel(data: data)
        
        XCTAssertEqual(modelList.topRateMovies.count, 2)
    }
    
    func testWhenExternalDataGiveUsTwoObjectsNowPlayingMovies(){
        data.movie = dataMock
        
        modelList = MovieViewModel(data: data)
        
        XCTAssertEqual(modelList.nowPlayingMovies.count, 2)
    }
    
    
    func testWhenExternalDataGiveUsTwoObjectsUpcommingMovies(){
        data.movie = dataMock
        
        modelList = MovieViewModel(data: data)
        
        XCTAssertEqual(modelList.upcommingMovies.count, 2)
    }
    
    func testWhenExternalDataGiveUsTwoObjectsPopularMovies(){
        
        data.movie = dataMock
        
        modelList = MovieViewModel(data: data)
        
        XCTAssertEqual(modelList.popularMovies.count, 2)
    }
}
