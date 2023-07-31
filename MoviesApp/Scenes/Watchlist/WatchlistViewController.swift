//
//  WatchlistViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.06.2023.
//

import UIKit


class WatchlistViewController: UIViewController {

    var watchList : [WatchListItem] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nowPlayingLbl: UILabel!
    
    var router: (MoviesRoutingLogic & MoviesDataPassing)?

    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureNavigationBar()
            configureNowPlayingLabel()
            configureCollectionView()
        }
        
       
        override func viewWillAppear(_ animated: Bool) {
            self.fetchWatchList()
            self.collectionView.reloadData()
        }
        
     
        func fetchWatchList() {
            self.watchList = CoreDataManager.shared.getWatchlist()
        }
        
        private func configureNavigationBar() {
            setLeftAlignTitleView(font: .proTextSemibold(size: 30)!, text: "Watchlist", textColor: UIColor(named: "fontColor") ?? .yellow)
       }

        
        private func configureNowPlayingLabel() {
            nowPlayingLbl.font = UIFont.proTextSemibold(size: 16)
            nowPlayingLbl.textColor = UIColor(named: "LaunchColor")
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

extension WatchlistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchlistCollectionViewCell", for: indexPath) as! WatchlistCollectionViewCell
        cell.setupOffline(with: watchList[indexPath.row])
       
        return cell
    }
}

extension WatchlistViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 325)
    }
}

extension WatchlistViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(watchList[indexPath.row].name)
        
        let selectedMovieId = watchList[indexPath.row].movieId
       
        if let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            destinationVC.movieId = selectedMovieId
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
        
        
    }
}
