//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height:   100))
        label.text = "Hello World"
        view.addSubview(label)
        label.center = view.center
        label.font = .proTextSemibold(size: 30)
        
    }


}

extension UIFont {
    static func proTextRegular(size: CGFloat) -> UIFont? {
        return UIFont(name: "SFProText-Regular", size: size)
    }
    static func proTextMedium (size: CGFloat) -> UIFont? {
        return UIFont(name: "SFProText-Medium", size: size)
    }
    static func proTextSemibold (size: CGFloat) -> UIFont? {
        return UIFont(name: "SFProText-Semibold", size: size)
    }
}

