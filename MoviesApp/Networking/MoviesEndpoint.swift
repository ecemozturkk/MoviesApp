//
//  MoviesEndpoint.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 29.06.2023.
//

import Foundation

public enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {

    public var queryItems: [URLQueryItem]? {
        switch self {
        case .topRated:
            return [URLQueryItem(name: "api_key", value: "727683fb49ec40794be37b676b80dfc1")]
        case .movieDetail(_): //case .movieDetail(id: <#T##Int#>)
            return nil
        }
    }
    
    public var path: String {
        switch self {
        case .topRated:
            return "/3/movie/top_rated"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .topRated, .movieDetail:
            return .get
        }
    }
    
    public var header: [String: String]? {
        //Singleton keychain manager
        switch self {
        case .topRated, .movieDetail:
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
