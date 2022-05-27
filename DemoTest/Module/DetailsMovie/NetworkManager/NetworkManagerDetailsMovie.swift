//
//  NetworkManagerDetailsMovie.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import Foundation


import Foundation

protocol NetworkManagerDetailsMovieProtocol{
    func getDataApiListImagesMovie(idMovie: Int, completion: @escaping([Backdrop]) -> ())
    func getDataApiDetailsMovie(idMovie: Int, completion: @escaping(DetailsMovie) -> ())
}


// MARK: - NetworkManagerDetailsMovie Capa de Conexión Api
class NetworkManagerDetailsMovie: NetworkManagerDetailsMovieProtocol
{
    func getDataApiListImagesMovie(idMovie: Int, completion: @escaping([Backdrop]) -> ()){
        
        guard let url = URL(string: String(format: NetworkManagerDetailsConstant.apiImages, "\(idMovie)", ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let movies = try JSONDecoder().decode(ImagesMovie.self, from: data)
                        DispatchQueue.main.async {
                            completion(movies.posters)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
    
    func getDataApiDetailsMovie(idMovie: Int, completion: @escaping(DetailsMovie) -> ()){
        
        guard let url = URL(string: String(format: ConstantMainApi.mainApi, "\(idMovie)", ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let details = try JSONDecoder().decode(DetailsMovie.self, from: data)
                        DispatchQueue.main.async {
                            completion(details)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
}
