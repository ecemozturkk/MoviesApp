import UIKit
import SDWebImage


class PaymentVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var movieDetailsContainer: DesignableView!
    @IBOutlet weak var seatNumber: UILabel!
    @IBOutlet weak var datTime: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!

    var originalViewY: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate for each text field
        name.delegate = self
        cvv.delegate = self
        date.delegate = self
        number.delegate = self
        self.movieDetailsContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.movieDetailsContainer.layer.borderWidth = 1
        self.movieDetailsContainer.layer.cornerRadius = 5

        number.keyboardType = .numberPad
        cvv.keyboardType = .numberPad
        date.keyboardType = .numberPad

        // Add a "Done" button to the numeric keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneButtonTapped))
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton]
        number.inputAccessoryView = toolbar
        cvv.inputAccessoryView = toolbar
        date.inputAccessoryView = toolbar

        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Store the original y-coordinate of the view for reset after keyboard dismissal
        originalViewY = self.view.frame.origin.y
        
        self.setMovieData()
    }
    
    
    func setMovieData() {
        
        let movie = DataShareHelper.shared.selectedMovie
        
        self.movieTitle.text = movie?.title
        
        if let imageUrl = URL(string: movie?.posterPath ?? "") {
            self.movieImage.sd_setImage(with: imageUrl, completed: nil)
        }
        self.seatNumber.text = "Seat: \(DataShareHelper.shared.selectedSeats)"
        self.datTime.text = "Timing - \(DataShareHelper.shared.selectedDate)"
        self.totalCost.text = DataShareHelper.shared.totalCoast
    }
    
    
    
    
    

    deinit {
        // Remove observers when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }

    // Selector for the "Done" button on the numeric keyboard
    @objc func onDoneButtonTapped(_ sender: Any) {
        number.resignFirstResponder()
        cvv.resignFirstResponder()
        date.resignFirstResponder()
    }


    // UITextFieldDelegate method to dismiss the keyboard on "Return" key tap
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // Helper method to show an alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let cvvMaxY = cvv.superview?.convert(cvv.frame, to: self.view).maxY {

            let distanceToBottom = self.view.frame.height - cvvMaxY
            let collapseSpace = keyboardSize.height - distanceToBottom

            if collapseSpace < 0 {
                // No need to collapse
                return
            }

            // Move the view upwards to show the CVV field above the keyboard
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = self.originalViewY - collapseSpace
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // Reset the view's position when the keyboard is dismissed
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = self.originalViewY
        }
    }
}


extension PaymentVC {
    
    
    @IBAction func onPlaceOrder(_ sender: Any) {
        // Check if card number and name are empty
       
        self.view.endEditing(true)
        
        if name.text?.isEmpty ?? true {
            showAlert(message: "Please enter name on card.")
            return
        }
        
        if number.text?.isEmpty ?? true {
            showAlert(message: "Please enter card number.")
            return
        }
        
        
        
        if date.text?.isEmpty ?? true {
            showAlert(message: "Please enter exp. date.")
            return
        }
        
        if cvv.text?.isEmpty ?? true {
            showAlert(message: "Please enter cvv number")
            return
        }
        
       
        showSuccessAlert()
    }
    
    
    func showSuccessAlert() {
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentSuccesAnimation") as! PaymentSuccesAnimation
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
      
        
        
        let movie = DataShareHelper.shared.selectedMovie
        
        
        guard let movie = movie else {
            return
        }
         
        let theater = DataShareHelper.shared.selectedTheater
        let date = DataShareHelper.shared.selectedDate
        let seats = DataShareHelper.shared.selectedSeats
        
        CoreDataManager.shared.saveBooking(movieId:movie.id,bannerPath:movie.bannerPath,movieName:movie.title, theater:theater,date:date,seat:seats)
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
        if let tabBarController = self.tabBarController {
              tabBarController.selectedIndex = 1
        }

    }
    
    
    
}
 

