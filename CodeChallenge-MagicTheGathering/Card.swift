//
//  Card.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation

struct Card {
    let name: String
    let manaCost: String
    let type: String
    let rarity: String //enum?
    let textDescription: String
    let flavor: String?
    let power: String
    let toughness: String
    let imageURL: String //UIImage 
    let rulings: [[String:String]]?
}
