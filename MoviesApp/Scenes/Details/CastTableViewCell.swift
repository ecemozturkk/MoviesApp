//
//  CastTableViewCell.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 3.07.2023.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet weak var castImg: UIImageView!
    @IBOutlet weak var dotsImg: UIImageView!
    @IBOutlet weak var castNameLbl: UILabel!
    @IBOutlet weak var characterNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
