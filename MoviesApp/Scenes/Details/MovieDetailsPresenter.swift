//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsPresentationLogic: AnyObject {
    
}

final class MovieDetailsPresenter: MovieDetailsPresentationLogic {
    
    weak var viewController: MovieDetailsDisplayLogic?
    
}
