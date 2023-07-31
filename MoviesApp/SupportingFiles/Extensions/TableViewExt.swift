//
//  TableViewExt.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

extension UITableView {
    
    func registerCells(_ cells : [UITableViewCell.Type]) {
        for cell in cells {
            self.register(UINib(nibName: String(describing: cell), bundle: Bundle.main), forCellReuseIdentifier: String(describing: cell))
        }
    }
}
extension UICollectionView {
    
    func registerCells(_ cells : [UICollectionViewCell.Type]) {
        for cell in cells {
            self.register(UINib(nibName: String(describing: cell), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: cell))
        }
    }
 
}



extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
