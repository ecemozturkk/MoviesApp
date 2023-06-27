//
//  CleanViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.06.2023.
//

import UIKit

protocol CleanDisplayLogic: AnyObject {
    
}

final class CleanViewController: UIViewController {
    
    var interactor: CleanBusinessLogic?
    var router: (CleanRoutingLogic & CleanDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CleanInteractor()
        let presenter = CleanPresenter()
        let router = CleanRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension CleanViewController: CleanDisplayLogic {
    
}
