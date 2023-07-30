//
//  CleanRouter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation
import UIKit

protocol MoviesRoutingLogic: AnyObject {
    func routeToMovieDetails(with movieID: Int)
}

protocol MoviesDataPassing: AnyObject {
    var dataStore: MoviesDataStore? { get }
}

final class MoviesRouter: MoviesRoutingLogic, MoviesDataPassing {
    func routeToMovieDetails(with movieID: Int) {
        //
    }
    
    
    weak var viewController: HomeViewController?
    var dataStore: MoviesDataStore?
    
}
