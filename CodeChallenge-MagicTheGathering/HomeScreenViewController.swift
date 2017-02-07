//
//  ViewController.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/1/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import UIKit
import RealmSwift
import NVActivityIndicatorView

class HomeScreenViewController: UIViewController {
    
    let realm = try! Realm()
    var cards: Results<Card>!

    @IBOutlet weak var homeScreenImage: UIImageView!
    
    @IBAction func enterButton(_ sender: Any) {
        //check to see if all images have been downloaded yet
        // print("card count: \(cards.count)")
        //else, activity indicator
//        OperationQueue.main.addOperation {
//            let loadingActivityIndicatorView = NVActivityIndicatorView(frame: self.view.frame, type: .ballBeat, color: UIColor.black, padding: 0.0)
//            self.view.addSubview(loadingActivityIndicatorView)
//            
//            loadingActivityIndicatorView.startAnimating()
//            
//            while self.cards.count < 50 {
//                print("waiting for images to load")
//            }
//            
//            loadingActivityIndicatorView.stopAnimating()
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cards = realm.objects(Card)
        
        MagicAPIClient.retrieveAllCardsRequest { (cards, nil) in
            print("called api client first time")
            print("from home screen, card count: \(cards.count)")
            
            for card in cards {
                print(card.name)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

