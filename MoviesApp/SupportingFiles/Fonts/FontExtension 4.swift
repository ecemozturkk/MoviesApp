//
//  FontExtension.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 5.07.2023.
//

import UIKit

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

extension UIViewController {
    func setLeftAlignTitleView(font: UIFont, text: String, textColor: UIColor) {
        guard let navFrame = navigationController?.navigationBar.frame else {
            return
        }
        
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: navFrame.width*3, height: navFrame.height))
        self.navigationItem.titleView = parentView
        
        let label = UILabel(frame: .init(x: parentView.frame.minX, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        
        parentView.addSubview(label)
    }
}
