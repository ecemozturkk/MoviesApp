//
//  CleanPresenter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

protocol MoviesPresentationLogic: AnyObject {
    func showMovies(response: MoviesModels.FetchMovies.Response)
}

final class MoviesPresenter: MoviesPresentationLogic {
    
    weak var viewController: MoviesDisplayLogic?
    
    func showMovies(response: MoviesModels.FetchMovies.Response) {
        
        var displayedMovies: [MoviesModels.FetchMovies.ViewModel.DisplayedMovie] = []
        
        response.movies.forEach {
            displayedMovies.append(MoviesModels.FetchMovies.ViewModel.DisplayedMovie(
                title: $0.title,
                id: $0.id,
                posterPath: "\(Constant.imageBaseUrl)\($0.posterPath)"
            )
            )
        }
        
        let viewModel = MoviesModels.FetchMovies.ViewModel(displayedMovies: displayedMovies)
        DispatchQueue.main.async {
            self.viewController?.displayFetchedMovies(viewModel: viewModel)
        }
    }
    
}
