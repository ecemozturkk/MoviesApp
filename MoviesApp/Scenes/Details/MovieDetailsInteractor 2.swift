//
//  MovieDetailsInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsBusinessLogic: AnyObject {
    
}

protocol MovieDetailsDataStore: AnyObject {
    
}

final class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailsDataStore {
    
    var presenter: MovieDetailsPresentationLogic?
    var worker: MovieDetailsWorkingLogic = MovieDetailsWorker()
    
}
