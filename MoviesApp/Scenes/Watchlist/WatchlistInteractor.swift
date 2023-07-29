//
//  WatchlistInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.07.2023.
//

import Foundation

protocol Movies2BusinessLogic: AnyObject {
    func fetchNowPlayingMovies()
}
protocol Movies2DataStore: AnyObject {
    var selectedMovieID: Int? { get set }
}
