//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 2.07.2023.
//

import UIKit
import SDWebImage

protocol MovieDetailsDisplayLogic: AnyObject {
    
}

final class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet var table: UITableView!

    
    
    
    var interactor: MovieDetailsBusinessLogic?
    var router: (MovieDetailsRoutingLogic & MovieDetailsDataPassing)?

    
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
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    

}


extension MovieDetailsViewController: MovieDetailsDisplayLogic {

}

