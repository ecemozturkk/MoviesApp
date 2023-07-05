//
//  CastModelStatic.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 5.07.2023.
//

import UIKit

struct Cast {
    let characterName: String
    let image: UIImage
    let realName: String
}

let casts: [Cast] = [
    Cast(characterName: "JOHN WICK", image: UIImage(named: "cast1")!, realName: "Keanu Reeves"),
    Cast(characterName: "SOFIA", image: UIImage(named: "cast2")!, realName: "Halle Berry"),
    Cast(characterName: "BOWERY KING", image: UIImage(named: "cast3")!, realName: "Laurence Fishburne"),
    Cast(characterName: "ZERO", image: UIImage(named: "cast4")!, realName: "Mark Dacasos"),
]
