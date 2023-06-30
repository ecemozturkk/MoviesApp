//
//  MoviesResponse.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 30.06.2023.
//

/*
 "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
 "title": "Fast X",
 "vote_average": 7.3,

 */

import Foundation

public struct MoviesResponse {
    public struct Movie: Codable {
        let title: String
        //let releaseDate: String
        let posterPath: String
        //let overview: String
        let voteAverage: Double
        
        enum CodingKeys: String, CodingKey {
            case title
            //case releaseDate = "release_date"
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
        }
    }
    
    public struct NowPlaying: Codable {
        let dates: Dates //
        let page: Int
        let totalPages: Int
        let totalResults: Int
        public let results: [Movie]
        
        enum CodingKeys: String, CodingKey {
            case page, results, dates
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }
    
    public struct Dates: Codable {
        let maximum: String
        let minimum: String
    }

}
