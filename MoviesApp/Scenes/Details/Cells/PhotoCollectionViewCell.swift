 
import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    func setImage(url:String) {
        
        guard let imageUrl = URL(string: url) else {
                   // Invalid URL, handle the error (e.g., set a placeholder image or display an error message)
                   self.profileImage.image = UIImage(named: "")
                   return
        }
         
        self.profileImage.sd_setImage(with: imageUrl, completed: nil)
        
        self.profileImage.layer.cornerRadius = 4
        self.profileImage.clipsToBounds = true
    }

}

