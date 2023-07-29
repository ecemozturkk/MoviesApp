//
//  CleanModels.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

enum MoviesModels {
    
    enum FetchMovies {
        
        struct Request {
            
        }
        
        struct Response {
            var movies: [MoviesResponse.Welcome.Movie]
        }
        
        struct ViewModel {
            var displayedMovies: [DisplayedMovie]
            
            struct DisplayedMovie {
                let title: String
                let id: Int
                let posterPath: String
                let releaseDate: String
            }
        }
        
    }
    
}
