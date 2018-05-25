//
//  MoviesViewModel.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/24/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    private let service: NetworkService
    private let api: MovieApi
    
    var movies = [Movie]()
    
    init() {
        // TODO: dependency injection
        service = Service()
        api = MovieApi(route: .newMovies(page: 1), environment: .production, apiKey: "")
    }
    
    func getNewMovies() {
        service.request(api) { [weak self] (data, response, error) in
            guard let data = data else {
                // handle error
                return
            }
            
            do {
                let response: MovieApiResponse = try JSONParser.parse(data: data)
                self?.movies = response.movies
                print(response.movies)
            } catch {
                // handle error
            }
        }
    }
}
