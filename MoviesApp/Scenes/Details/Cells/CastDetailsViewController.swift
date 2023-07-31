 
import UIKit

class CastDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var castDetails : [MovieDetialsModel.FetchDetail.CastDetails] = []
    var crewDetails:  [MovieDetialsModel.FetchDetail.CrewDetails] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.title = "Cast & Crew"
        self.tableView.registerCells([CastCell.self])
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.tintColor = .black
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        if(section == 0) {
            return castDetails.count
        }else {
            return crewDetails.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
            let data = self.castDetails[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: CastCell.identifier, for: indexPath) as! CastCell
            cell.setData(imageUrl: data.profileUrl, name: data.name, inCastJobOrName: data.nameInMovie)
            return  cell
        }else {
            let data = self.crewDetails[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: CastCell.identifier, for: indexPath) as! CastCell
            cell.setData(imageUrl: data.profileUrl ?? "", name: data.name, inCastJobOrName: data.job )
            return  cell
        }
      
        
     }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    

}


 
