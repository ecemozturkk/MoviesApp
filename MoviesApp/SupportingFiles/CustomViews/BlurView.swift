//
//  BlurView.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

protocol Blurable {
    func addBlur(_ alpha: CGFloat)
}

extension Blurable where Self: UIView {
    func addBlur(_ alpha: CGFloat = 0.3) {
        // create effect
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        
        // set boundry and alpha
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.alpha = alpha
        
        self.addSubview(effectView)
    }
}

// Conformance
extension UIView: Blurable {}
