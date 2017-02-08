//
//  CardDetailViewController.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/7/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import UIKit
import RealmSwift

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var manaCostLabel: UILabel!
    
    static var selectedCard: Card?
    var cards: Results<Card>!
    // not sure if we need reference to Realm in this VC 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("selectedCard: \(CardDetailViewController.selectedCard!.name)")
        
        if let realm = try? Realm() {
            cards = realm.objects(Card.self)
        }
        
        print("\n\ncards currently in realm from detail view")
        print(cards.count)
        for card in cards {
            print(card.name)
        }
        print("------ DETAIL END ------")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cardImage.image = Card.obtainCardImageFrom(cardData: CardDetailViewController.selectedCard!.imageData)
        self.cardNameLabel.text = CardDetailViewController.selectedCard?.name
        self.manaCostLabel.text = CardDetailViewController.selectedCard?.manaCost
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
