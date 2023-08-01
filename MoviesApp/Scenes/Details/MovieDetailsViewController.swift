//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 2.07.2023.
//

import UIKit
import SDWebImage

enum CellType  {
    case cast
    case photos
}

protocol MovieDetailsDisplayLogic: AnyObject {
    func displayMovieDetails(viewModel: MovieDetialsModel.FetchDetail.ViewModel.MovieDetails)
    func displayCredits(viewModel: MovieDetialsModel.FetchDetail.ViewModel.MovieCredits)
}

final class MovieDetailsViewController: UIViewController {
    
    var movieId = 0
    var castDetails : [MovieDetialsModel.FetchDetail.CastDetails] = []
    var crewDetails:  [MovieDetialsModel.FetchDetail.CrewDetails] = []
    var imageUrls = ["https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg","https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg","https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg"]
    
    var movieDetails : MovieDetialsModel.FetchDetail.ViewModel.MovieDetails?
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieBanner: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var customRatingView: FloatRatingView!
    @IBOutlet weak var overViewTextView: UITextView!
    
    
    var cellTypes :[CellType] = [.cast,.photos]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
       
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .white
    }

    func setupView(){
        self.tableView.isHidden = true
        self.tableView.registerCells([CastCellContainer.self,PhotosCell.self])
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .clear
        customRatingView.isUserInteractionEnabled = false
        self.movieBanner.addBlur(0.7)
        tableView.contentInsetAdjustmentBehavior = .never // Prevent content inset adjustment
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Adjust the content inset to make space for the custom header view
        // Set the navigation bar background to transparent
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController?.navigationBar.shadowImage = UIImage()

           // Optionally, you can also remove the navigation bar's border if needed:
           self.navigationController?.navigationBar.isTranslucent = true
           self.navigationController?.navigationBar.backgroundColor = UIColor.clear

      
           // Optionally, you can also remove the navigation bar's border if needed:
           self.navigationController?.navigationBar.isTranslucent = true
           self.navigationController?.navigationBar.backgroundColor = UIColor.clear

           // Add a right bar item with a map image
           let mapImage = UIImage(named: "icon_map.png") // Replace "map_icon" with the name of your map image
           mapImage?.withTintColor(.white)
           let mapButtonItem = UIBarButtonItem(image: mapImage, style: .plain, target: self, action: #selector(mapButtonTapped))
           self.navigationItem.rightBarButtonItem = mapButtonItem

           interactor?.fetchMovieDetails(movieId:self.movieId)
           interactor?.fetchMovieCredits(movieId:self.movieId)
          
          }
    
    @objc func mapButtonTapped() {
        print("MAP Tapped")
        // Handle the tap event for the map button here
    }
    
    
    @IBAction func addWatchlist(_ sender: Any) {
        guard let movie = self.movieDetails else  {
            print("Movie details or movie ID is nil.")
            return
        }
        
        CoreDataManager.shared.saveToWatchList(date: movie.releaseDate, imageUrl: movie.posterPath,name: movie.title, rating: movie.rating, movieId: movie.id)
    }
    
    @IBAction func onTicket(_ sender: Any) {
        
        guard let movie = self.movieDetails else  {
            print("Movie details or movie ID is nil.")
            return
        }
        
        DataShareHelper.shared.selectedMovie = movie
        
        self.pushVC(viewConterlerId: "SelectTheatreVC")
    }
}

    


extension MovieDetailsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if(cellTypes[indexPath.row] == .cast) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CastCellContainer.identifier, for: indexPath) as! CastCellContainer
            cell.setData(castDetails: self.castDetails, crewDetails: self.crewDetails)
            cell.viewAllButton.addTarget(self, action: #selector(viewAllButtonTapped(_:)), for: .touchUpInside)
            return  cell
            
        }else if(cellTypes[indexPath.row] == .photos) {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosCell.identifier, for: indexPath) as! PhotosCell
            cell.viewAllButton.addTarget(self, action: #selector(viewAllButtonTappedPhotos(_:)), for: .touchUpInside)
            cell.setData(urls: imageUrls)
            return  cell
        }
        
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosCell.identifier, for: indexPath) as! PhotosCell
           
            return  cell
            
        }
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
        if(cellTypes[indexPath.row] == .cast) {
            return 360
        }else {
            return 120
        }
    }
    
    
}

extension MovieDetailsViewController {
    
    @objc func viewAllButtonTapped(_ sender: UIButton) {
        
        if let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CastDetailsViewController") as? CastDetailsViewController {
            destinationVC.castDetails = self.castDetails
            destinationVC.crewDetails = self.crewDetails
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
        
    }
    
    @objc func viewAllButtonTappedPhotos(_ sender: UIButton) {
        
        if let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoDetailsVC") as? PhotoDetailsViewController {
            destinationVC.imageUrls = self.imageUrls
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
        
    }
    
    
}
extension MovieDetailsViewController: MovieDetailsDisplayLogic {
   
    
    func displayMovieDetails(viewModel: MovieDetialsModel.FetchDetail.ViewModel.MovieDetails) {
        self.tableView.isHidden = false
        
        self.movieDetails = viewModel
        
        if let imageUrl = URL(string: viewModel.posterPath) {
            self.movieImage.sd_setImage(with: imageUrl, completed: nil)
        }
        
        if let bannerImageUrl = URL(string: viewModel.bannerPath) {
            self.movieBanner.sd_setImage(with: bannerImageUrl, completed: nil)
        }
        
        self.movieTitle.text = viewModel.title
        self.movieDuration.text = viewModel.runTime
        self.movieType.text = viewModel.genres
        self.overViewTextView.text = viewModel.overview
        self.overViewTextView.isEditable = false
        
        self.customRatingView.rating = viewModel.rating
        let formattedRating = String(format: "%.2f", viewModel.rating)
        self.ratingText.text = "\(formattedRating)/5"
        print(viewModel.title)
        
    }
    
    
    func displayCredits(viewModel: MovieDetialsModel.FetchDetail.ViewModel.MovieCredits) {
        self.crewDetails = viewModel.crew
        self.castDetails = viewModel.cast
        self.tableView.reloadData()
    }
    
}


