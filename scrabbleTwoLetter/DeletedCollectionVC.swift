//
//  deletedCollectionVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/15/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class DeletedCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var deletedScrabbleWords: [ScrabbleWord]!
    
    
    override func viewDidLoad() {
        deletedScrabbleWords = StoreWord().getWord()
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        deletedScrabbleWords = DataService.instance.deletedWords
    }

    override func viewDidAppear(animated: Bool) {
        print("I appeared!")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deletedScrabbleWords.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WordCell", forIndexPath: indexPath) as? WordCell{
            cell.configureCell(deletedScrabbleWords[indexPath.row])
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    @IBAction func titleButton(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
