//
//  NetworkManagerConstant.swift
//  DemoTest
//
//  Created by Dahyanna on 25-05-22.
//

import Foundation

struct ValueSessionUser{
    static let token = "e9ad5ea37bb280db1c9b1fd71b11f931"
}

struct ConstantMainApi{
    static let mainApi = "https://api.themoviedb.org/3/movie/%@?api_key=%@"
}

enum NetworkManagerConstant : String{
    case movieRate = "top_rated"
    case moviePopular = "popular"
    case movieUpcomming = "upcoming"
    case movieNowPlaying = "now_playing"
}

enum ResponseStatus: Int{
    case successful = 200
}

