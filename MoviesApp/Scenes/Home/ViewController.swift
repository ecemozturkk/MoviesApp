//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {

    let worker = MoviesWorker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        worker.getNowPlaying { result in
            print(result)
        }
    }


}

