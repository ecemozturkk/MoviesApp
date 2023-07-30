//
//  MovieDetailsInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsBusinessLogic: AnyObject {
    func fetchMovieDetails(movieId:Int)
    func fetchMovieCredits(movieId:Int)
}

protocol MovieDetailsDataStore: AnyObject {
    func setMovieId(movieID:Int)
}


final class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailsDataStore {
   
  
    var presenter: MovieDetailsPresentationLogic?
    var worker: MovieDetailsWorkingLogic = MovieDetailsWorker()
    
    var movieId:Int?
    
    func setMovieId(movieID: Int) {
        self.movieId = movieID
    }
    
    func getMovieId()->Int {
        return  self.movieId ?? 0
    }
    
    func fetchMovieDetails(movieId: Int) {
        worker.getMovieDetails(movieId: movieId) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movieDetails):
                let response = MovieDetialsModel.FetchDetail.Response(movieDetials: movieDetails)
                self.presenter?.showMovieDetails(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchMovieCredits(movieId: Int) {
        worker.getMovieCredits(movieId: movieId) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let movieCredits):
                let response = MovieDetialsModel.FetchDetail.ResponseCredit(movieCredits: movieCredits)
                self.presenter?.showMovieCredits(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
   
}
