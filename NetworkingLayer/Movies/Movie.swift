//
//  MovieModel.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

struct MovieApiResponse: Codable {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let movies: [Movie]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        movies = try container.decode([Movie].self, forKey: .movies)
    }
    
    private enum CodingKeys: String, CodingKey {
        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case movies = "results"
    }
}

struct Movie: Codable {
    let id: Int
    let posterPath: String
    let backdrop: String
    let title: String
    let releaseDate: String
    let rating: Double
    let overview: String
    
    init(from decoder: Decoder) throws {
        let movieContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try movieContainer.decode(Int.self, forKey: .id)
        posterPath = try movieContainer.decode(String.self, forKey: .posterPath)
        backdrop = try movieContainer.decode(String.self, forKey: .backdrop)
        title = try movieContainer.decode(String.self, forKey: .title)
        releaseDate = try movieContainer.decode(String.self, forKey: .releaseDate)
        rating = try movieContainer.decode(Double.self, forKey: .rating)
        overview = try movieContainer.decode(String.self, forKey: .overview)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdrop = "backdrop_path"
        case title
        case releaseDate = "release_date"
        case rating = "vote_average"
        case overview
    }
}
