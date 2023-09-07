 

import UIKit

class CastCellContainer: UITableViewCell {

    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSet = false
    
    var castDetails : [MovieDetialsModel.FetchDetail.CastDetails] = []
    var crewDetails:  [MovieDetialsModel.FetchDetail.CrewDetails] = []
   
    override func awakeFromNib() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.isScrollEnabled = false
        self.tableView.registerCells([CastCell.self])
        self.tableView.tableFooterView = UIView()
    }
    
    func setData(castDetails:[MovieDetialsModel.FetchDetail.CastDetails],crewDetails:[MovieDetialsModel.FetchDetail.CrewDetails]) {
         
            if(!dataSet) {
                if(castDetails.count > 0) {
                    self.castDetails = castDetails
                    self.crewDetails = crewDetails
                    dataSet = true
                    self.tableView.reloadData()
                }
               
            }
    }
}


extension CastCellContainer: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        if(castDetails.count > 4) {
            return  4
        }else {
            return castDetails.count
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let data = self.castDetails[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CastCell.identifier, for: indexPath) as! CastCell
        cell.setData(imageUrl: data.profileUrl, name: data.name, inCastJobOrName: data.nameInMovie)
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
