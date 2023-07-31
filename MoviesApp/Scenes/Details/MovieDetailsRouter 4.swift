//
//  MovieDetailsRouter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsRoutingLogic: AnyObject {
    
}

protocol MovieDetailsDataPassing: AnyObject {
    var dataStore: MovieDetailsDataStore? { get }
}

final class MovieDetailsRouter: MovieDetailsRoutingLogic, MovieDetailsDataPassing {
    
    weak var viewController: MovieDetailsViewController?
    var dataStore: MovieDetailsDataStore?
    
}
