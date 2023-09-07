//
//  MoviesEndpoint.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 29.06.2023.
//

import Foundation

public enum MoviesEndpoint {
    case nowPlaying
    case moviesDetail(id: Int)
    case credits(id: Int) // https://api.themoviedb.org/3/movie/385687/credits?api_key=727683fb49ec40794be37b676b80dfc1
}

extension MoviesEndpoint: Endpoint {

    public var queryItems: [URLQueryItem]? {
        switch self {
        case .nowPlaying, .moviesDetail(_), .credits(_):
            return [URLQueryItem(name: "api_key", value: "727683fb49ec40794be37b676b80dfc1")]
        }
    }
    
    public var path: String {
        switch self {
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .moviesDetail(let id):
            return "/3/movie/\(id)"
        case .credits(let id):
            return "/3/movie/\(id)/credits"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .nowPlaying, .moviesDetail, .credits:
            return .get
        }
    }
    
    public var header: [String: String]? {
        //Singleton keychain manager
        switch self {
        case .nowPlaying, .moviesDetail, .credits:
            return [
                "Content-Type": "application/json;charset=utf-8"
                //"Authorization": "Bearer \(accessToken)"
            ]
        }
    }
    
    public var body: [String : String]? {
        return nil
    }
}

struct Constant  {
    static var imageBaseUrl: String {"https://image.tmdb.org/t/p/w500/"}
}
