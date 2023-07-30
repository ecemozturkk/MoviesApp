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

func getRatings(voteAverage:Double)->Double {
    return  max(0, min(5, voteAverage / 2.0)) // devide by 2 bcz need only rating between 0 to 5
}
