//
//  MovieModelStatic.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 5.07.2023.
//

import UIKit

struct Movie {
    let title: String
    let image: UIImage
    let genre: String
    let time: String
}

let movies: [Movie] = [
    Movie(title: "John Wick 3", image: #imageLiteral(resourceName: "movie1"), genre: "Crime", time: "2 hr 10m"),
    Movie(title: "Captain Marvel", image: #imageLiteral(resourceName: "movie2"), genre: "Action",time: "2hr 25m"),
    Movie(title: "Alita", image: #imageLiteral(resourceName: "movie3"), genre: "Action", time:"2 hr 10m"),
    Movie(title: "Avengers", image: #imageLiteral(resourceName: "movie4"),genre: "Action", time:"2 hr 10m"),
    Movie(title: "John Wick 3", image: #imageLiteral(resourceName: "movie1"), genre: "Crime", time: "2 hr 10m"),
    Movie(title: "Captain Marvel", image: #imageLiteral(resourceName: "movie2"), genre: "Action",time: "2hr 25m"),
    Movie(title: "Alita", image: #imageLiteral(resourceName: "movie3"), genre: "Action", time:"2 hr 10m"),
    Movie(title: "Avengers", image: #imageLiteral(resourceName: "movie4"),genre: "Action", time:"2 hr 10m")
]
