//
//  DenemeInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.07.2023.
//

import Foundation

protocol DenemeBusinessLogic: AnyObject {
    
}

protocol DenemeDataStore: AnyObject {
    
}

final class DenemeInteractor: DenemeBusinessLogic, DenemeDataStore {
    
    var presenter: DenemePresentationLogic?
    var worker: DenemeWorkingLogic = DenemeWorker()
    
}
