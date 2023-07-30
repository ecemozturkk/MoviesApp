//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 18.06.2023.
//


import UIKit
import SDWebImage

protocol MoviesDisplayLogic: AnyObject {
    func displayFetchedMovies(viewModel: MoviesModels.FetchMovies.ViewModel)
}

final class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nowPlayingLbl: UILabel!
    
    
    var interactor: MoviesBusinessLogic?
    var router: (MoviesRoutingLogic & MoviesDataPassing)?
    var displayedMovies: [MoviesModels.FetchMovies.ViewModel.DisplayedMovie] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        navigationItem.title = "Now Playing"
        
        interactor?.fetchNowPlayingMovies()
    }

    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter()
        let router = MoviesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        //presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}




