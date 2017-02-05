//
//  MagicAPIDataParser.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/5/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import RealmSwift

struct MagicAPIDataParser {
    
    enum MagicDataParseError: Error { case InvalidJSONDictionaryCast, InvalidDictionaryResponse }
    
    static func retrieveAllCardsDataParser(from cardInformation: [String:[NSDictionary]]) -> [Card] {
        
        var allCards = [Card]()
        
        if let allCardInfo = cardInformation["cards"] {
            // print("extracted card info: \n\n \(allCardInfo)\n")
            // print("card count: \(allCardInfo.count)")

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
                
                let newCard = Card(name: name, manaCost: manaCost, type: type, rarity: rarity, textDescription: textDescription, power: power, toughness: toughness, imageURL: imageURL)
                print("\n********** CARD INFO **********")
                print("name: \(newCard.name) \nmana cost: \(newCard.manaCost) \ntype: \(newCard.type) \nrarity: \(newCard.rarity) \ntextDescription: \(newCard.textDescription) \npower: \(newCard.power) \ntoughness: \(newCard.toughness) \nimageURL: \(newCard.imageURL)")
                print("*******************************\n")
                allCards.append(newCard)
                
                //need to persist this in realm?
            }

        }


        print(allCards.count)
        
        return allCards
    }
    
    static func retrieveCardFromSearchDataParser() {
        
    }
    
    func downloadCardImage(from url: String) /* -> uiimage */ {
        
    }
}


