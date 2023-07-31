 
import UIKit

class PaymentSuccesAnimation: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        
               DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                   self.dismiss(animated: true, completion: nil)
               }
    }
    
   
}
