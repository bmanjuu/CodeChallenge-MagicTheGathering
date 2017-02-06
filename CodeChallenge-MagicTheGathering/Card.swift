//
//  Card.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class Card: Object {
    dynamic var name: String = ""
    dynamic var manaCost: String = ""
    dynamic var type: String = ""
    dynamic var rarity: String = "" //enum? common (black), uncommon (silver), rare (gold), mythic rare (red/orange)
    dynamic var textDescription: String = ""
    dynamic var power: String = ""
    dynamic var toughness: String = ""
    dynamic var imageURL: String = ""
    dynamic var imageData: Data = Data()
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    init(name: String, manaCost: String, type: String, rarity: String, textDescription: String, power: String, toughness: String, imageURL: String, imageData: Data) {
        
        super.init()
        
        self.name = name
        self.manaCost = manaCost
        self.type = type
        self.rarity = rarity
        self.textDescription = textDescription
        self.power = power
        self.toughness = toughness
        self.imageURL = imageURL
        self.imageData = imageData
    }
    
    static func downloadDataFromImageURL(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    static func saveCardImageDataFrom(urlString: String) -> Data {
        let url = URL(string: urlString)!
        var cardImageData = Data()
        
        downloadDataFromImageURL(url: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            print("data for image: \(data)")
            cardImageData = data
        }
        
        while cardImageData.isEmpty {
            print("downloading image data")
        }
        
        print("image size downloaded: \(cardImageData)")

        return cardImageData
    }
    
    static func obtainCardImageFrom(cardData: Data) -> UIImage {
        return UIImage(data: cardData)!
    }
    
    static func removeOptionalTextFrom(cardValue: String) -> String {
        
        if cardValue == "nil" {
            return "N/A" // or return empty string? 
        }
        
        //range to extract text from within "optional()" parentheses
        let textRange = cardValue.index(cardValue.startIndex, offsetBy: 9)..<cardValue.index(before: cardValue.endIndex)
        
        return cardValue.substring(with: textRange)
    }
    
}


//need to remove duplicate card values before adding them to realm, or else adding the following will result in an RLMException error (duplicate for card named: Forest) 

//override class func primaryKey() -> String? {
//    return "name"
//}
//
//override class func indexedProperties() -> [String] {
//    return ["rarity", "type", "manaCost"]
//}
