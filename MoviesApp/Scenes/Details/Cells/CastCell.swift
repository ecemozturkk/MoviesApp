 
import UIKit
import SDWebImage


class CastCell: UITableViewCell {

    
    @IBOutlet weak var castImage: UIImageView!
    @IBOutlet weak var castName: UILabel!
    @IBOutlet weak var inCastJobOrName: UILabel!
    
    override   func awakeFromNib() {
        self.castImage.layer.cornerRadius = self.castImage.frame.size.height / 2
    }
    
    func setData(imageUrl:String,name:String,inCastJobOrName:String) {
        if let imageUrl = URL(string: imageUrl) {
            self.castImage.sd_setImage(with: imageUrl, completed: nil)
        }
        self.castName.text = name
        self.inCastJobOrName.text = inCastJobOrName
        
    }
}
