//
//  TicketCell.swift
//  MoviesApp
//
//  Created by MONO-HYD-MAC-13 on 31/07/23.
//

import UIKit
import SDWebImage


class TicketCell: UITableViewCell {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var seat: UILabel!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var timing: UILabel!
    @IBOutlet weak var theater: UILabel!
    
    
    override func awakeFromNib() {
        
        // Set border width and color
        container.layer.borderWidth = 1.0
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 3
        container.layer.masksToBounds = false
        container.layer.cornerRadius = 10
    }
    
    func setData(booking:BookingItem) {
        
        self.name.text = booking.movieName
        self.timing.text = booking.date
        self.theater.text = booking.theater
        self.seat.text = booking.seat
        
        if let imageUrl = URL(string: booking.bannerPath) {
            self.banner.sd_setImage(with: imageUrl, completed: nil)
        }
        
       
         
    }
    
}
