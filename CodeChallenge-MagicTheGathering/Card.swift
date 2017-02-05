//
//  Card.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import UIKit

struct Card {
    let name: String
    let manaCost: String
    let type: String
    let rarity: String //enum? common (black), uncommon (silver), rare (gold), mythic rare (red/orange)
    let textDescription: String
    let power: String
    let toughness: String
    let imageURL: String
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
    
    //idea for displaying card
    //user clicks on card, it expands to fit the screen, tap again and the card flips over to the back with an overlay that contains textual description of what's on the card 
    
}
