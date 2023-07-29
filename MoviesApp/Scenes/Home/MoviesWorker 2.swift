//
//  CleanWorker.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

protocol MoviesWorkingLogic: AnyObject {
    
    func getNowPlaying(_ completion: @escaping (Result<MoviesResponse.Welcome.NowPlaying, RequestError>) -> Void)

}

final class MoviesWorker: MoviesWorkingLogic,HTTPClient {

    func getNowPlaying(_ completion: @escaping (Result<MoviesResponse.Welcome.NowPlaying, RequestError>) -> Void) {
        sendRequest(endpoint: MoviesEndpoint.nowPlaying, responseModel: MoviesResponse.Welcome.NowPlaying.self, completion: completion)
    }
    
    
//    func getNowPlaying(_ completion: @escaping (Result<MoviesResponse.NowPlaying, RequestError>) -> Void) {
//        sendRequest(endpoint: MoviesEndpoint.nowPlaying, responseModel: MoviesResponse.NowPlaying.self) { result in
//
//            switch result {
//            case .success(let response):
//                completion(.success(response))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
}

