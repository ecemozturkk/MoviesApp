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
    
    @IBOutlet weak var tableView: UITableView!
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}

extension HomeViewController: MoviesDisplayLogic {
    func displayFetchedMovies(viewModel: MoviesModels.FetchMovies.ViewModel) {
        displayedMovies = viewModel.displayedMovies
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucre1", for: indexPath) as! MoviesTableViewCell
        cell.titleLbl.text = displayedMovies[indexPath.row].title
        
        
        if let imageUrl = URL(string: displayedMovies[indexPath.row].posterPath) {
               cell.movieImg.sd_setImage(with: imageUrl, completed: nil)
           }
            

       return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovieId = displayedMovies[indexPath.row].id
        router?.routeToMovieDetails(with: selectedMovieId)
    }
    
}


