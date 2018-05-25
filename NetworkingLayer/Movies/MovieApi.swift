//
//  MovieApi.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

enum MovieApiRoute {
    case recommended(id:Int)
    case popular(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
}

struct MovieApi {
    let route: MovieApiRoute
    let environment: NetworkEnvironment
    let apiKey: String
}

extension MovieApi: Endpoint {
    
    var environmentBaseURL : String {
        switch environment {
        case .production: return "https://api.themoviedb.org/3/movie/"
        case .qa: return "https://qa.themoviedb.org/3/movie/"
        case .staging: return "https://staging.themoviedb.org/3/movie/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch route {
        case .recommended(let id):
            return "\(id)/recommendations"
        case .popular:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch route {
        case .newMovies(let page):
            return .requestParameters(bodyParameters: nil, urlParameters: ["page": page, "api_key": apiKey])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
