//
//  CleanInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation
//Interactor => Business logic

protocol MoviesBusinessLogic: AnyObject {
    func fetchNowPlayingMovies()
}

protocol MoviesDataStore: AnyObject {
    var selectedMovieID: Int? { get set }
}

final class MoviesInteractor: MoviesBusinessLogic, MoviesDataStore {
    
    var selectedMovieID: Int?
    
    var presenter: MoviesPresentationLogic?
    var worker: MoviesWorkingLogic = MoviesWorker()
    
    func fetchNowPlayingMovies() {
        worker.getNowPlaying { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let nowPlaying):
                let response = MoviesModels.FetchMovies.Response(movies: nowPlaying.results)
                self.presenter?.showMovies(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
