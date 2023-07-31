//
//  TicketsViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.06.2023.
//

import UIKit

class TicketsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var bookingItem : [BookingItem] = []
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCells([TicketCell.self])
        self.tableView.tableFooterView = UIView()
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        
        titleLabel.text = "Tickets"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.proTextSemibold(size: 24)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.bookingItem = CoreDataManager.shared.getBookings().reversed()
        self.tableView.reloadData()
    }
    
}


extension TicketsViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookingItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketCell.identifier, for: indexPath) as! TicketCell
        cell.setData(booking:self.bookingItem[indexPath.row])
        return  cell
    }
    
}




