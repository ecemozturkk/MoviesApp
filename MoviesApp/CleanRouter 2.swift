//
//  CleanRouter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

protocol CleanRoutingLogic: AnyObject {
    
}

protocol CleanDataPassing: class {
    var dataStore: CleanDataStore? { get }
}

final class CleanRouter: CleanRoutingLogic, CleanDataPassing {
    
    weak var viewController: CleanViewController?
    var dataStore: CleanDataStore?
    
}
