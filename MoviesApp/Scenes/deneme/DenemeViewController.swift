//
//  DenemeViewController.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 12.07.2023.
//

import UIKit

class DenemeViewController: UIViewController, UICollectionViewDataSource {

    private let collectionView = UICollectionView(
        frame:.zero,
        collectionViewLayout: DenemeViewController.createLayout()
    )
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.register(DenemeCollectionViewCell.self, forCellWithReuseIdentifier: DenemeCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        
//        let layout = UICollectionViewFlowLayout()
//        collectionView.collectionViewLayout = layout
        
        
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(2/5)
            ),
            subitem: item,
            count: 2
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)

        // Return
        return UICollectionViewCompositionalLayout(section: section)

    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
                                                                            )
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), repeatingSubitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DenemeCollectionViewCell.identifier, for: indexPath)
        return cell

    }
}


//import UIKit
//
//class DenemeViewController: UIViewController, UICollectionViewDataSource {
//
//    private let collectionView = UICollectionView(
//        frame:.zero,
//        collectionViewLayout: UICollectionViewLayout()
//    )
//
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//        view.addSubview(collectionView)
//        collectionView.register(DenemeCollectionViewCell.self, forCellWithReuseIdentifier: DenemeCollectionViewCell.identifier)
//        collectionView.frame = view.bounds
//        collectionView.backgroundColor = .white
//        collectionView.dataSource = self
//
//        let layout = UICollectionViewFlowLayout()
//        collectionView.collectionViewLayout = layout
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DenemeCollectionViewCell.identifier, for: indexPath)
//        return cell
//
//    }
//}
