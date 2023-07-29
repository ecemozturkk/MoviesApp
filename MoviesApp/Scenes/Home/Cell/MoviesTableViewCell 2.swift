//
//  MoviesTableViewCell.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import UIKit
import SDWebImage

class MoviesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}

