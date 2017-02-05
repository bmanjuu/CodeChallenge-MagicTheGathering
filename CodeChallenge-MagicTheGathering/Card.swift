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
    let manaCost: String?
    let type: String
    let rarity: String //enum?
    let textDescription: String
    let power: String?
    let toughness: String?
    let imageURL: String //UIImage
    // let flavor: String?
    // let rulings: [[String:String]]?
    
    init(name: String, manaCost: String, type: String, rarity: String, textDescription: String, power: String, toughness: String, imageURL: String) {
        self.name = name
        self.manaCost = manaCost
        self.type = type
        self.rarity = rarity
        self.textDescription = textDescription
        self.power = power
        self.toughness = toughness
        self.imageURL = imageURL
    }
    
}
