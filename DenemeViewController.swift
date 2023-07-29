//
//  DenemeViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 26.07.2023.
//

import UIKit

protocol DenemeDisplayLogic: AnyObject {
    
}

final class DenemeViewController: UIViewController {
    
    var interactor: DenemeBusinessLogic?
    var router: (DenemeRoutingLogic & DenemeDataPassing)?
    
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
        let interactor = DenemeInteractor()
        let presenter = DenemePresenter()
        let router = DenemeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension DenemeViewController: DenemeDisplayLogic {
    
}
