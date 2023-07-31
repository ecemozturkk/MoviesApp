//
//  TicketsViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.06.2023.
//

import UIKit

class TicketsViewController: UIViewController{
    
    @IBOutlet weak var screenLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        screenLbl.font = UIFont.proTextMedium(size: 16)
        let attributedString = NSMutableAttributedString(string: screenLbl.text ?? "")
        let letterSpacing: CGFloat = 2 // Harfler arasındaki mesafe değeri
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, attributedString.length))
        screenLbl.attributedText = attributedString
    }
}




