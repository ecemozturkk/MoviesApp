//
//  CleanPresenter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

protocol CleanPresentationLogic: AnyObject {
    
}

final class CleanPresenter: CleanPresentationLogic {
    
    weak var viewController: CleanDisplayLogic?
    
}
