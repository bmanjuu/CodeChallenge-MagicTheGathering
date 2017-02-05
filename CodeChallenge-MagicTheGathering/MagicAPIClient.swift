//
//  MagicAPIClient.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/1/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import Foundation

struct MagicAPIClient {

    // var searchRequestURL = getCardsBaseURL + user query paramters
    
    typealias cardCompletion = ([Card], Error?) -> ()
    
    enum MagicAPIError: Error { case InvalidJSONDictionaryCast, InvalidDictionaryResponseKey, InvalidDictionaryDocsKey }
    
    func retrieveAllCardsRequest(completion: cardCompletion) {
        
        let session = URLSession(configuration: .default)
        let getCardsBaseURL = URL(string: "https://api.magicthegathering.io/v1/cards")
        let dataTask = session.dataTask(with: getCardsBaseURL!, completionHandler: { (data, response, error) in
            
            if let data = data {
                do {
                    let responseData = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                } catch {
                    print(MagicAPIError.InvalidDictionaryResponseKey)
                }
            }
            
        })
        
        dataTask.resume()
    }
}
