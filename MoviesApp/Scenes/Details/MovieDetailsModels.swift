//
//  MovieDetailsModels.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

enum MovieDetialsModel {
    
    enum FetchDetail {
        
        struct Request {
            
        }
        
        struct Response {
            var movieDetials: MovieDetailsResponse
        }
        
        struct ResponseCredit {
            var movieCredits: MovieCreditResponse
        }
        
        struct ViewModel {
            var movieDetails: MovieDetails
            var movieCredits: MovieCredits
            
            struct MovieDetails {
                let title: String
                let id: Int
                let posterPath: String
                let releaseDate: String
                let overview: String
                let bannerPath:String
                let runTime:String
                let genres:String
                let rating:Double
            }
            
            struct MovieCredits {
                let cast: [CastDetails]
                let crew: [CrewDetails]
            }
        }
        
        
        struct CastDetails: Codable {
            let name: String
            let profileUrl: String
            let nameInMovie: String
        }

        struct CrewDetails: Codable {
            let name: String
            let profileUrl: String?
            let job: String
        }
    }
    
}

