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

    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("LinkedIn", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        button.center = view.center

        
    }
    
    @objc private func didTapButton() {
        guard let url = URL(string: "https://www.linkedin.com/in/ecemozturk704/") else {
            return
        }
        let vc = WebViewController(url: url, title: "LinkedIn")
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
        
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




