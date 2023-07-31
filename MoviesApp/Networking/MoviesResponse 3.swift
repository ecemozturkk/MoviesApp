//
//  MoviesResponse.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 30.06.2023.
//

import Foundation


public struct MoviesResponse {
    
    //var movies: [MoviesResponse.MovieNowPlaying.Movie]
    
    public struct Welcome: Codable {
        
        public struct NowPlaying: Codable {
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
        
        public struct Movie: Codable {
            let title: String
            let releaseDate: String
            let posterPath: String
            let overview: String
            let id: Int
            
            enum CodingKeys: String, CodingKey {
                case title, overview, id
                case releaseDate = "release_date"
                case posterPath = "poster_path"
            }
        }
    }
    
    public struct MovieDetail: Codable {
        public struct Movie: Codable {
            let title: String
            let releaseDate: String
            let posterPath: String
            let overview: String
            let id: Int
            let runtime: Int
            let vote: Float
            
            enum CodingKeys: String, CodingKey {
                case title, overview, id, runtime
                case releaseDate = "release_date"
                case posterPath = "poster_path"
                case vote = "vote_average"
            }
        }
        
    }
    

}

