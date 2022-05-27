//
//  NetworkManager.swift
//  DemoTest
//
//  Created by Dahyanna on 25-05-22.
//

import Foundation

protocol NetworkManagerProtocol{
    func getDataApiMovieRate(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ())
    func getDataApiMoviePopular(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ())
    func getDataApiMovieNowPlaying(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ())
    func getDataApiMovieUpcomming(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ())
}


// MARK: - NetworkManager Capa de Conexión Api
class NetworkManager: NetworkManagerProtocol
{
    func getDataApiMovieRate(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ()){
        
        guard let url = URL(string: String(format: ConstantMainApi.mainApi, movieType.rawValue, ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(movies.results)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
    
    func getDataApiMoviePopular(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ()){
        
        guard let url = URL(string: String(format: ConstantMainApi.mainApi, movieType.rawValue, ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(movies.results)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
    
    func getDataApiMovieNowPlaying(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ()){
        
        guard let url = URL(string: String(format: ConstantMainApi.mainApi, movieType.rawValue, ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(movies.results)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
    
    func getDataApiMovieUpcomming(movieType: NetworkManagerConstant, completion: @escaping([Movie]) -> ()){
        
        guard let url = URL(string: String(format: ConstantMainApi.mainApi, movieType.rawValue, ValueSessionUser.token)) else {return}
            URLSession.shared.dataTask(with: url) { data, success, error in
                guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                    return
                }
                if response.statusCode == ResponseStatus.successful.rawValue {
                    do {
                        
                        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(movies.results)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            } .resume()
    }
}
