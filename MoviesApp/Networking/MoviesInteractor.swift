//
//  MoviesInteractor.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 30.06.2023.
//

import Foundation
//Interactor => Business logic

protocol MoviesInteractorDelegate: AnyObject {}

protocol MoviesBusinessLogic: AnyObject {
    func fetchTopRatedMovies()
}

final class MovieInteractor: MoviesBusinessLogic {
    
    var worker: MoviesWorkingLogic = MoviesWorker()
    
    func fetchTopRatedMovies() {
        worker.getTopRated{ result in
            switch result {
            case .success(let movieResponse):
                print(movieResponse)
            case .failure(let error):
                print(error)
                //self.presenter.presentError
            }
        }
    }
    
    
}
