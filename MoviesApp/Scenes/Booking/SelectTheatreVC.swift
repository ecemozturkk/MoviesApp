 

import UIKit

class SelectTheatreVC: UIViewController{

    @IBOutlet weak var theatreButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    let globalPicker = GlobalPicker()
    let dateTimePicker = GlobalDateTimePicker()
    
    let theaterNamesInTurkey = [
        "Gray Movie Theater",
        "Pink Movie Theater",
        "Red Movie Theater",
        "Green Movie Theater",
        "Yellow Movie Theater",
        "Black Movie Theater",
        "Gray Movie Theater",
        "Purple Movie Theater"
    ]
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = .black
        self.theatreButton.setTitle("Select Theater", for: .normal)
        self.dateButton.setTitle("Select Date", for: .normal)
    }
    
   
    @IBAction func onDate(_ sender: Any) {
        
               dateTimePicker.onDone = { date in
                   // Handle the selected date
                   let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-dd HH:mm"
                   let dateString = formatter.string(from: date)
                   print("Selected date: \(dateString)")
                   self.dateButton.setTitle(dateString, for: .normal)
               }
               dateTimePicker.modalPresentationStyle = .overCurrentContext
     
               present(dateTimePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func onTheatre(_ sender: Any) {
        
        
        globalPicker.stringArray = self.theaterNamesInTurkey
        
        globalPicker.modalPresentationStyle = .overCurrentContext
        
        globalPicker.onDone = { index in
            let data =  self.theaterNamesInTurkey[index]
            self.theatreButton.setTitle(data, for: .normal)
        }
       
        present(globalPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func onGetTicket(_ sender: Any) {
        
        if(self.dateButton.currentTitle   == "Select Date") {
            showAlertAnyWhere(message: "Please Select Date")
            return
        }
        
        if(self.theatreButton.currentTitle == "Select Theater") {
            showAlertAnyWhere(message: "Please Select Theater")
            return
        }
        
        DataShareHelper.shared.selectedDate = self.dateButton.currentTitle!
        DataShareHelper.shared.selectedTheater = self.theatreButton.currentTitle!
      
        self.pushVC(viewConterlerId: "SeatBookingVC")
    }
    
  
}
