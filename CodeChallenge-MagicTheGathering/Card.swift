//
//  Card.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import UIKit

class Card {
    let name: String
    let manaCost: String
    let type: String
    let rarity: String //enum? common (black), uncommon (silver), rare (gold), mythic rare (red/orange)
    let textDescription: String
    let power: String
    let toughness: String
    let imageURL: String
    var image: UIImage
    // let flavor: String?
    // let rulings: [[String:String]]?
    
    init(name: String, manaCost: String, type: String, rarity: String, textDescription: String, power: String, toughness: String, imageURL: String, image: UIImage) {
        self.name = name
        self.manaCost = manaCost
        self.type = type
        self.rarity = rarity
        self.textDescription = textDescription
        self.power = power
        self.toughness = toughness
        self.imageURL = imageURL
        self.image = image
    }
    
    static func getDataFromImageUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    static func downloadCardImage(from urlString: String) -> UIImage {
        let url = URL(string: urlString)!
        var cardImage = UIImage()
        
        getDataFromImageUrl(url: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            cardImage = UIImage(data: data)!
        }
        
        return cardImage
    }
    
    //idea for displaying card
    //user clicks on card, it expands to fit the screen, tap again and the card flips over to the back with an overlay that contains textual description of what's on the card 
    
}
