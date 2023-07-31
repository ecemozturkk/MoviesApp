//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

struct MovieDetailsResponse: Codable {
    
    let genres: [Genre]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String
    let backdrop_path: String
    let releaseDate: String
    let runTime: Int
    let title: String
    let rating:Double
    
    enum CodingKeys: String, CodingKey {
        case genres
        case id
        case overview
        case popularity
        case backdrop_path
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runTime = "runtime"
        case title
        case rating = "vote_average"
    }
}


struct Genre: Codable {
    let id: Int
    let name: String
}


struct MovieCreditResponse: Codable {
    let id: Int?
    let cast: [Cast]?
    let crew: [Crew]?
}

struct Cast: Codable {
    let id: Int
    let name: String?
    let profile_path: String?
    let character: String?
}


struct Crew: Codable {
    let id: Int?
    let name: String?
    let popularity: Double?
    let profile_path: String?
    let job: String?
}

