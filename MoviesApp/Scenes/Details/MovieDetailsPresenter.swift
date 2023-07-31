//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import Foundation

protocol MovieDetailsPresentationLogic: AnyObject {
    func showMovieDetails(response: MovieDetialsModel.FetchDetail.Response)
    func showMovieCredits(response: MovieDetialsModel.FetchDetail.ResponseCredit)
}

final class MovieDetailsPresenter: MovieDetailsPresentationLogic {
    
    weak var viewController: MovieDetailsDisplayLogic?
    
    func showMovieCredits(response: MovieDetialsModel.FetchDetail.ResponseCredit) {
         
          let cast = response.movieCredits.cast?.map {
              MovieDetialsModel.FetchDetail.CastDetails(name: $0.name ?? "", profileUrl: "\(Constant.imageBaseUrl)\($0.profile_path ?? "")", nameInMovie: $0.character ?? "")
           }
           
           let crew = response.movieCredits.crew?.map {
               MovieDetialsModel.FetchDetail.CrewDetails(name: $0.name ?? "", profileUrl: "\(Constant.imageBaseUrl)\($0.profile_path ?? "")", job: $0.job ?? "")
           }
           
           let viewModel = MovieDetialsModel.FetchDetail.ViewModel.MovieCredits(cast: cast ?? [] , crew: crew ?? [] )
        
            DispatchQueue.main.async {
              self.viewController?.displayCredits(viewModel: viewModel)
            }
        
       }
    
    
    func showMovieDetails(response: MovieDetialsModel.FetchDetail.Response) {
        
        //var displayedMovies: [MovieDetialsModel.FetchDetail.ViewModel.MovieDetails] = []
        
        let movie = response.movieDetials
        
        let viewModel = MovieDetialsModel.FetchDetail.ViewModel.MovieDetails(title: movie.title, id: movie.id, posterPath: "\(Constant.imageBaseUrl)\(movie.posterPath)", releaseDate: movie.releaseDate, overview: movie.overview, bannerPath: "\(Constant.imageBaseUrl)\(movie.backdrop_path)", runTime: convertToHoursAndMinutes(runtimeInMinutes: movie.runTime), genres: self.combineGenres(movie.genres), rating: getRatings(voteAverage: movie.rating))
        
    
        DispatchQueue.main.async {
            self.viewController?.displayMovieDetails(viewModel: viewModel)
        }
    
       
    }
    
    func combineGenres(_ genres: [Genre]) -> String {
        let genreNames = genres.map { $0.name }
        let combinedString = genreNames.joined(separator: ", ")
        return combinedString
    }
    
    
   
    func convertToHoursAndMinutes(runtimeInMinutes: Int) -> String {
        let hours = runtimeInMinutes / 60
        let minutes = runtimeInMinutes % 60
        
        var formattedTime = ""
        
        if hours > 0 {
            formattedTime += "\(hours)H "
        }
        
        formattedTime += "\(minutes) Min"
        
        return formattedTime
    }

    
}

func getRatings(voteAverage:Double)->Double {
    return  max(0, min(5, voteAverage / 2.0)) // devide by 2 bcz need only rating between 0 to 5
}
