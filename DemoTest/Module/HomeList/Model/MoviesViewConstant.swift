//
//  MoviesViewConstant.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import Foundation

struct MoviesViewConstant{
    struct cellView{
        static let cornerRadius = 16.0
    }
    
    struct viewDetails{
        static let apiMainImg = "https://image.tmdb.org/t/p/w500%@"
    }
    
    struct pageMovies{
        static let heightCell = 150.0
        static let spacingCell = 16.0
    }
    
    struct detailsMovies{
        static let heightCell = 250.0
        static let widthCell = 180.0
        static let spacingCell = 20.0
        static let sizeTitle = 16.0
        static let sizeSubTitle = 8.0
    }
    
    struct labelText{
        static let popularTitle = "Popular"
        static let toprateTitle = "To Rate"
        static let upcommingTitle = "Upcomming"
        static let nowPlayingTitle = "Now Playing"
        static let titleNavigation = "Movies"
    }
}
