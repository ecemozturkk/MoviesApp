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

final class MovieDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var castTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    /*
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var imgSmall: UIImageView!
    @IBOutlet weak var movieNamelbl: UILabel!
    @IBOutlet weak var movieDurationlbl: UILabel!
    @IBOutlet weak var movieCategorylbl: UILabel!
    @IBOutlet weak var movieRatelbl: UILabel!
    @IBOutlet weak var getTicketBtn: UIButton!
    @IBOutlet weak var addWatchlistBtn: UIButton!
    @IBOutlet weak var castTableView: UITableView!
    @IBOutlet weak var synopsisTextView: UITextView!
    @IBOutlet weak var synpsisLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var viewAllBtn: UIButton!
     */
    
    
    
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
        
        castTableView.dataSource = self
        castTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == castTableView {
            return casts.count
        } else {
            // tableView'a ait olan satır sayısını döndürün
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == castTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "oyuncuHucre", for: indexPath) as! CastTableViewCell
            
            cell.setup(with: casts[indexPath.row])
            
            return cell
        } else {
            // tableView'a ait olan hücreyi döndürün
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == castTableView {
            // İstenilen satıra tıklanınca gerçekleştirilecek işlemler
        } else {
            // tableView'a ait olan satıra tıklanınca gerçekleştirilecek işlemler
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == castTableView {
            // castTableView'deki hücre yüksekliğini belirlemek için gerektiğinde kullanabilirsiniz
            return 100
        } else {
            // tableView'a ait olan hücre yüksekliğini belirlemek için gerektiğinde kullanabilirsiniz
            return 0
        }
    }


    

}


extension MovieDetailsViewController: MovieDetailsDisplayLogic {

}

