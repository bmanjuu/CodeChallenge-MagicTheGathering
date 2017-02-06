//
//  Card.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import RealmSwift

class Card: Object {
    dynamic var name: String
    dynamic var manaCost: String
    dynamic var type: String
    dynamic var rarity: String //enum? common (black), uncommon (silver), rare (gold), mythic rare (red/orange)
    dynamic var textDescription: String
    dynamic var power: String
    dynamic var toughness: String
    dynamic var imageURL: String
    dynamic var image: UIImage
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
    override class func indexedProperties() -> [String] {
        return ["rarity", "type", "manaCost"]
    }
}
