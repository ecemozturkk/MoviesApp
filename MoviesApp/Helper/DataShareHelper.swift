//
//  DataShareHelper.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

class DataShareHelper  {

    private init() {}
    
    static let shared = DataShareHelper()

    var selectedMovie :  MovieDetialsModel.FetchDetail.ViewModel.MovieDetails?
    var selectedDate = ""
    var selectedTheater = ""
    var selectedSeats = ""
    var totalCoast = ""
}
