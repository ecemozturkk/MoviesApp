//
//  WatchlistRouter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.07.2023.
//

import Foundation
import UIKit

protocol Movies2RoutingLogic: AnyObject {
    func routeToMovieDetails(with movieID: Int)
}

protocol Movies2DataPassing: AnyObject {
    var dataStore: MoviesDataStore? { get }
}
