//
//  WatchlistCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 5.07.2023.
//

import UIKit

class WatchlistCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ratingOffline: FloatRatingView?
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieTimeLbl: UILabel!
    @IBOutlet weak var ratingView: FloatRatingView?
    
    
    func setupOnline(with movie: MoviesModels.FetchMovies.ViewModel.DisplayedMovie) {

        movieTitleLbl.text = movie.title
        movieTimeLbl.text = movie.releaseDate
        
        if let imageUrl = URL(string: movie.posterPath) {
            self.movieImageView.sd_setImage(with: imageUrl, completed: nil)
        }
        self.ratingView?.rating = movie.rating
    }
    
    func setupOffline(with movie: WatchListItem) {

        movieTitleLbl.text = movie.name
        movieTimeLbl.text = movie.date
        
        if let imageUrl = URL(string: movie.imageUrl) {
            self.movieImageView.sd_setImage(with: imageUrl, completed: nil)
        }
        self.ratingOffline?.rating = movie.rating
        
    }
}
