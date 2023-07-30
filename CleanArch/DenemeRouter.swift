//
//  DenemeRouter.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.07.2023.
//

import Foundation

protocol DenemeRoutingLogic: AnyObject {
    
}

protocol DenemeDataPassing: AnyObject {
    var dataStore: DenemeDataStore? { get }
}

final class DenemeRouter: DenemeRoutingLogic, DenemeDataPassing {
    
    weak var viewController: DenemeViewController?
    var dataStore: DenemeDataStore?
    
}
