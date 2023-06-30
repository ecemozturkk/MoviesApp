//
//  MoviesResponse.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 30.06.2023.
//

import Foundation

public struct MoviesResponse {
    public struct Movie: Codable {
        let title: String
        let releaseDate: String
        let posterPath: String
        let overview: String
        
        enum CodingKeys: String, CodingKey {
            case title, overview
            case releaseDate = "release_date"
            case posterPath = "poster_path"
        }
    }
    
    public struct TopRated: Codable {
        let page: Int
        let totalPages: Int
        let totalResults: Int
        public let results: [Movie]
        
        enum CodingKeys: String, CodingKey {
            case page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }
}
