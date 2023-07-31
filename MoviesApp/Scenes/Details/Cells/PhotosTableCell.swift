 import UIKit
 import SDWebImage

class PhotosTableCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    
  
    func setImage(url:String) {
        
        guard let imageUrl = URL(string: url) else {
                   // Invalid URL, handle the error (e.g., set a placeholder image or display an error message)
                   self.photo.image = UIImage(named: "")
                   return
        }
         
        self.photo.sd_setImage(with: imageUrl, completed: nil)
        
        self.photo.layer.cornerRadius = 4
        self.photo.clipsToBounds = true
    }
    
}
