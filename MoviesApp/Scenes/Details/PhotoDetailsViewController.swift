//
//  PhotoDetailsViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit
import SDWebImage

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var imageUrls = ["https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg",
                     "https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg",
                     "https://image.tmdb.org/t/p/w500//nHf61UzkfFno5X1ofIhugCPus2R.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCells([PhotosTableCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        self.title = "Photos"
        self.tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.tintColor = .black
    }
    
  
    
}

extension PhotoDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableCell.identifier, for: indexPath) as! PhotosTableCell
        cell.setImage(url: self.imageUrls[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225 // (224 + 5 + 5) for cell height with top and bottom spacing.
    }
}
