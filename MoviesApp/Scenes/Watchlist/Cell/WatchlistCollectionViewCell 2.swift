//
//  WatchlistCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 5.07.2023.
//

import UIKit

class WatchlistCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var starsStackView: UIStackView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieGenreLbl: UILabel!
    @IBOutlet weak var movieTimeLbl: UILabel!
    
    
    func setup(with movie: Movie) {
            movieImageView.image = movie.image
            movieTitleLbl.text = movie.title
            movieGenreLbl.text = movie.genre
            movieTimeLbl.text = movie.time
        }
    
    
}
