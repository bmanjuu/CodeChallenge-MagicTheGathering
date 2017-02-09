//
//  MagicCardsCollectionViewController.swift
//  CodeChallenge-MagicTheGathering
//
//  Created by Betty Fung on 2/1/17.
//  Copyright © 2017 Betty Fung. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

private let reuseIdentifier = "card"
fileprivate let sectionInsets = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
fileprivate let itemsPerRow: CGFloat = 2

class ViewAllMagicCardsCollectionViewController: UICollectionViewController {
    
    //accessing card information stored in Realm
    var cards: Results<Card>!
    
    //PLAN:
    //add a search bar on top that filters cards based on name 
    //extra: search using other filters such as mana cost, rarity, and type
    //extra: when user clicks on card, it expands to fit the screen, tap again and the card flips over to the back with an overlay that contains textual description of what's on the card
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let realm = try? Realm() {
            cards = realm.objects(Card.self)
            
            print("from view did load of collection view, before adding new cards")
            print("card count: \(cards.count)")
            print("cards include")
            for card in cards {
                print(card.name)
            }
            print("------ END COLLECTION VIEWDID LOAD ------")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        let magicCard = cards[indexPath.row]
        let magicCardImage = Card.obtainCardImageFrom(cardData: magicCard.imageData)

        cell.cardImageView.image = magicCardImage
    
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        MagicAPIClient.retrieveAllCardsRequest { (cards, nil) in
//            print("CLOSURE STUFF")
//            print("called API for \(MagicAPIClient.pageNumber) time")
//            print("from collection view, after adding new cards")
//            print("card count: \(cards.count)")
//            for card in cards {
//                print(card.name)
//            }
//            print("------------- CLOSURE --------------------")
        }
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        CardDetailViewController.selectedCard = cards[indexPath.row]
        print("presenting details for \(self.cards[indexPath.row])")
        
    }

    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension ViewAllMagicCardsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

