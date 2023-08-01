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
        
        configureNavigationBar()
        configureNowPlayingLabel()
        configureCollectionView()
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
    
    private func configureNavigationBar() {
        setLeftAlignTitleView(font: .proTextSemibold(size: 30)!, text: "Movies", textColor: UIColor(named: "fontColor") ?? .yellow)
    }
    
    
    private func configureNowPlayingLabel() {
        nowPlayingLbl.font = UIFont.proTextSemibold(size: 16)
        nowPlayingLbl.textColor = UIColor(named: "LaunchColor")
    }
    
}

extension HomeViewController: MoviesDisplayLogic {
    func displayFetchedMovies(viewModel: MoviesModels.FetchMovies.ViewModel) {
        displayedMovies = viewModel.displayedMovies
        collectionView.reloadData()
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchlistCollectionViewCell", for: indexPath) as! WatchlistCollectionViewCell
        cell.setupOnline(with: displayedMovies[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 325)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovieId = displayedMovies[indexPath.row].id
        router?.routeToMovieDetails(with: selectedMovieId)
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10 // Hücreler arasındaki yatay boşluk
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // Kenarlardan hücrelere olan uzaklık
        collectionView.collectionViewLayout = flowLayout
    }
}


