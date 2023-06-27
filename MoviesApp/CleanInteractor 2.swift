//
//  CleanInteractor.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import Foundation

protocol CleanBusinessLogic: AnyObject {
    
}

protocol CleanDataStore: AnyObject {
    
}

final class CleanInteractor: CleanBusinessLogic, CleanDataStore {
    
    var presenter: CleanPresentationLogic?
    var worker: CleanWorkingLogic = CleanWorker()
    
}
