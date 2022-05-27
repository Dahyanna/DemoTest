//
//  MovieDetailsTest.swift
//  DemoTestTests
//
//  Created by Dahyanna on 27-05-22.
//

import XCTest
@testable import DemoTest

class MovieDetailsTest: XCTestCase {
    
    var galleryDataMock: [Backdrop] = [.init(filePath: "htpp//:", voteAverage: 23.33, voteCount: 7000, width: 150),
        .init(filePath: "htpp//:", voteAverage: 23.33, voteCount: 7000, width: 150)]
    
    var detailsDataMock: DetailsMovie = .init(adult: true, backdropPath: "wwww.", budget: 23, genres: [Genre.init(id: 22, name: "Action")], homepage: "www.", id: 1233, imdbID: "none", originalLanguage: "none", originalTitle: "none", overview: "none...", popularity: 7.0, posterPath: "www.", productionCompanies: [ProductionCompany.init(id: 12, logoPath: "www.", name: "none", originCountry: "Chile")], releaseDate: "23-01-2021", revenue: 2, runtime: 30, status: "none", tagline: "none", title: "none", video: true, voteAverage: 2.33, voteCount: 123233)
    
    var modelViewDetails: MovieDetailsViewModel!
    var data: NetworkDetailsStub!
    
    override func setUpWithError() throws {
        data = NetworkDetailsStub()
        modelViewDetails = MovieDetailsViewModel(data: data)
        modelViewDetails.idmovie = 1233
    }

    override func tearDownWithError() throws {
        modelViewDetails = nil
    }
    
    func testWhenExternalDataGiveUsTwoObjectsToprateMovies(){
        data.details = detailsDataMock
        
        modelViewDetails = MovieDetailsViewModel(data: data)
        modelViewDetails.idmovie = 1233
        
        if let id = modelViewDetails.detailsMovie?.id {
            XCTAssertEqual(id, modelViewDetails.idmovie)
        }
    }
    
    func testWhenExternalDataGiveUsDetailsMovie(){
        data.gallery = galleryDataMock
        modelViewDetails = MovieDetailsViewModel(data: data)
        modelViewDetails.idmovie = 1233
        
        XCTAssertEqual(modelViewDetails.imagesMovies.count, 2)
    }
}
