//
//  ProfileViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.06.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var switchTheme: UISwitch!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func switchThemeValueChanged(_ sender: UISwitch) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let appDelegate = windowScene.windows.first {
                if sender.isOn {
                    appDelegate.overrideUserInterfaceStyle = .dark
                } else {
                    appDelegate.overrideUserInterfaceStyle = .light
                }

            }
    }

}




