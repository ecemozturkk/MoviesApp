//
//  Endpoint.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 29.06.2023.
//

import Foundation

public protocol Endpoint {
    var scheme: String {get} // { get }, bir özelliğin sadece okunabilir (get) olduğunu belirtmek için kullanılır
    var host: String {get}
    var path: String {get}
    var method: RequestMethod {get}
    var header: [String: String]? {get}
    var body: [String: String]? {get}
    var queryItems: [URLQueryItem]? {get}
}

/*
https://api.themoviedb.org/3/movie/now_playing?api_key=727683fb49ec40794be37b676b80dfc1
scheme => http,https
host => api.themoviedb.org
path => host'dan sonra gelen kısım => "/3/movie/now_playing"
query item => soru işaretinden sonra gelen kısım => "api_key=727683fb49ec40794be37b676b80dfc1"
*/

extension Endpoint {
    public var scheme : String {
        return "https"
    }
    
    public var host: String {
        return "api.themoviedb.org"
    }
}

