//
//  MapperHomeListModel.swift
//  DemoTest
//
//  Created by Dahyanna on 27-05-22.
//

import Foundation

struct MapperHomeListModel{
    static func mapperToModel(model: Movie)-> MovieFinal{
        return .init(id: model.id, tile: model.title, posterPath: model.posterPath)
    }
}

struct MovieFinal{
    let id: Int
    let tile: String
    let posterPath: String
}
