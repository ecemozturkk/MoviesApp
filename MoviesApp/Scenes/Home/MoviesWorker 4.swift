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

}

