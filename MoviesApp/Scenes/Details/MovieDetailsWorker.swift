//
//  MovieDetailsWorker.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsWorkingLogic: AnyObject {
    func getMovieDetails(movieId:Int,_ completion: @escaping (Result<MovieDetailsResponse, RequestError>) -> Void)
    func getMovieCredits(movieId:Int,_ completion: @escaping (Result<MovieCreditResponse, RequestError>) -> Void)
}

final class MovieDetailsWorker: MovieDetailsWorkingLogic,HTTPClient {
  
    func getMovieDetails(movieId:Int,_ completion: @escaping (Result<MovieDetailsResponse, RequestError>) -> Void) {
        sendRequest(endpoint: MoviesEndpoint.moviesDetail(id: movieId), responseModel: MovieDetailsResponse.self, completion: completion)
    }

    func getMovieCredits(movieId:Int,_ completion: @escaping (Result<MovieCreditResponse, RequestError>) -> Void) {
        sendRequest(endpoint: MoviesEndpoint.credits(id: movieId), responseModel: MovieCreditResponse.self, completion: completion)
    }
}
