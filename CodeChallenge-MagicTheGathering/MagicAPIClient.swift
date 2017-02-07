//
//  MagicAPIClient.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/1/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation
import RealmSwift

class MagicAPIClient {
    
    typealias cardCompletion = ([Card], Error?) -> ()
    
    enum MagicAPIError: Error { case InvalidJSONDictionaryCast, InvalidDictionaryResponse }
    
    static var pageNumber = 0
    
    static func retrieveAllCardsRequest(completion: @escaping cardCompletion) {
        
        let session = URLSession(configuration: .default)
        
        pageNumber+=1
        let getCardsBaseURL = URL(string: "https://api.magicthegathering.io/v1/cards?page=\(pageNumber)&pageSize=50")
        print("PAGE NUMBER: \(pageNumber)")
        
        let dataTask = session.dataTask(with: getCardsBaseURL!, completionHandler: { (data, response, error) in
            
            if let data = data {
                do {
                    let responseData = try JSONSerialization.jsonObject(with: data, options: []) as! [String:[NSDictionary]]
                    
                    completion(MagicAPIDataParser.retrieveAllCardsDataParser(from: responseData), nil)
                } catch {
                    print(MagicAPIError.InvalidDictionaryResponse)
                }
            }
            
        })
        
        dataTask.resume()
    }
    
    static func retrieveCardFromSearch() {
        
    }
}
