//
//  MagicAPIDataParser.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class MagicAPIDataParser {
    
    enum MagicDataParseError: Error { case InvalidJSONDictionaryCast, InvalidDictionaryResponse }
    
    static func retrieveAllCardsDataParser(from cardInformation: [String:[NSDictionary]]) -> [Card] {
        
        let realm = try! Realm()
        var allCards = [Card]()
        
        if let allCardInfo = cardInformation["cards"] {

            for card in allCardInfo {
                
                //used string interpolation in the following statement to account for string values that were not formatted with quotation marks in the JSON response -- Xcode could not interpret/parse through these values prior to doing this

                guard let
                    name = "\(card["name"])" as? String,
                    let manaCost = "\(card["manaCost"])" as? String,
                    let type = "\(card["type"])" as? String,
                    let rarity = "\(card["rarity"])" as? String,
                    let textDescription = "\(card["text"])" as? String,
                    let power = "\(card["power"])" as? String,
                    let toughness = "\(card["toughness"])" as? String,
                    let imageURL = "\(card["imageUrl"])" as? String else {
                        print(MagicDataParseError.InvalidJSONDictionaryCast); return [Card]()}
                
                let newCard = Card(
                    name: Card.removeOptionalTextFrom(cardValue: name),
                    manaCost: Card.removeOptionalTextFrom(cardValue: manaCost),
                    type: Card.removeOptionalTextFrom(cardValue: type),
                    rarity: Card.removeOptionalTextFrom(cardValue: rarity),
                    textDescription: Card.removeOptionalTextFrom(cardValue: textDescription),
                    power: Card.removeOptionalTextFrom(cardValue: power),
                    toughness: Card.removeOptionalTextFrom(cardValue: toughness),
                    imageURL: Card.removeHTTPFromURL(url: imageURL)
                )

                print("\n********** CARD INFO **********")
                print("name: \(newCard.name) \nmana cost: \(newCard.manaCost) \ntype: \(newCard.type) \nrarity: \(newCard.rarity) \ntextDescription: \(newCard.textDescription) \npower: \(newCard.power) \ntoughness: \(newCard.toughness) \nimageURL: \(newCard.imageURL)")
                print("*******************************\n")
                allCards.append(newCard)
            }
        }
        
        try! realm.write {
            realm.add(allCards)
        }
        
        return allCards
    }
    
    static func retrieveCardFromSearchDataParser() {
    }
    
}


