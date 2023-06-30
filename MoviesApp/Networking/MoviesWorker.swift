//
//  MoviesWorker.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 30.06.2023.
//

import Foundation

protocol MoviesWorkingLogic: AnyObject {
    func getTopRated(_ completion: @escaping (Result <MoviesResponse.TopRated, RequestError>) -> Void)
}

final class MoviesWorker: HTTPClient, MoviesWorkingLogic {
    func getTopRated(_ completion: @escaping (Result<MoviesResponse.TopRated, RequestError>) -> Void) {
        sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: MoviesResponse.TopRated.self) { result in
            
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
