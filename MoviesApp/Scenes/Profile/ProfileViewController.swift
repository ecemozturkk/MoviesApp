//
//  ProfileViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 27.06.2023.
//

import UIKit
import SocialButton

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var pointsNumberLbl: UILabel!
    @IBOutlet weak var totalPointsLbl: UILabel!
    @IBOutlet weak var moviesNumberLbl: UILabel!
    @IBOutlet weak var moviesWatchedLbl: UILabel!
    @IBOutlet weak var darkModeLbl: UILabel!
    @IBOutlet weak var switchTheme: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var linkedinButton: SocialButton!
    @IBOutlet weak var githubButton: SocialButton!
    @IBOutlet weak var mailButton: SocialButton!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
            switchTheme.isOn = darkMode
        }

    
        configureNavigationBar()
        configureLabels()
        setupUI()
        

    }
    func setupUI() {
        linkedinButton?.setupButtonImage(imageName: "linkedinIcon")
        linkedinButton.setupButtonBackground(color: UIColor(named: "linkedinColor")!)
        githubButton.setupButtonImage(imageName: "github")
        githubButton.setupButtonBackground(color: .black)
        mailButton.setupButtonImage(imageName: "gmail")
        mailButton.setupButtonBackground(color: UIColor(named: "gmailColor")!)
    }
    private func configureNavigationBar() {
        setLeftAlignTitleView(font: .proTextSemibold(size: 30)!, text: "Profile", textColor: UIColor(named: "fontColor") ?? .black)
   }
    
    private func configureLabels() {
        nameLbl.font = UIFont.proTextSemibold(size: 24)
        nameLbl.textColor = UIColor(named: "fontColor")
        memberLbl.font = UIFont.proTextSemibold(size: 12)
        memberLbl.backgroundColor = UIColor(named: "memberBackground")
        mailLbl.font = UIFont.proTextRegular(size: 14)
        mailLbl.textColor = UIColor(named: "grayFontColor")
        pointsNumberLbl.font = UIFont.proTextSemibold(size: 30)
        pointsNumberLbl.textColor = UIColor(named: "fontColor")
        totalPointsLbl.font = UIFont.proTextMedium(size: 12)
        totalPointsLbl.textColor = UIColor(named: "grayFontColor")
        moviesNumberLbl.font = UIFont.proTextSemibold(size: 30)
        moviesNumberLbl.textColor = UIColor(named: "fontColor")
        moviesWatchedLbl.font = UIFont.proTextMedium(size: 12)
        moviesWatchedLbl.textColor = UIColor(named: "grayFontColor")
        darkModeLbl.font = UIFont.proTextSemibold(size: 18)
        darkModeLbl.textColor = UIColor(named: "fontColor")
    }
    
    @IBAction func linkedinButtonTapped(_ sender: UIButton) {
        openWebViewController(urlString: "https://www.linkedin.com/in/ecemozturk704/", title: "LinkedIn")
    }
    
    @IBAction func mailButtonTapped(_ sender: UIButton) {
        openWebViewController(urlString: "https://mail.google.com/mail", title: "Gmail")
    }
    
    @IBAction func githubButtonTapped(_ sender: UIButton) {
        openWebViewController(urlString: "https://github.com/ecemozturkk", title: "GitHub")
    }
    
    
    @IBAction func switchThemeValueChanged(_ sender: UISwitch) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let appDelegate = windowScene.windows.first {
            UserDefaults.standard.set(sender.isOn, forKey: "darkMode")
            if sender.isOn {
                appDelegate.overrideUserInterfaceStyle = .dark
            } else {
                appDelegate.overrideUserInterfaceStyle = .light
            }
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let appDelegate = windowScene.windows.first {
                UserDefaults.standard.set(sender.isOn, forKey: "darkMode")
                if sender.isOn {
                    appDelegate.overrideUserInterfaceStyle = .dark
                } else {
                    appDelegate.overrideUserInterfaceStyle = .light
                }
                
            }
        }
        
    }
    
    public func openWebViewController(urlString: String, title: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let vc = WebViewController(url: url, title: title)
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    

}
