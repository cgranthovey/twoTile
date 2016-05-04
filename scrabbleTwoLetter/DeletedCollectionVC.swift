//
//  deletedCollectionVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/15/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class DeletedCollectionVC: GeneralCollectionVC, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var deletedScrabbleWords: [ScrabbleWord]!
    var savedScrabbleWords: [ScrabbleWord]!
    
    override func viewDidLoad() {
        deletedScrabbleWords = [ScrabbleWord]()
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func viewDidAppear(animated: Bool) {
        collectionView.reloadData()
        deletedScrabbleWords = DataService.instance.deletedWords
        savedScrabbleWords = DataService.instance.savedWords
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
            
            let iSelector = Selector("moveImg:")
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: iSelector)
            leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: iSelector)
            rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
            cell.addGestureRecognizer(rightSwipe)
            cell.addGestureRecognizer(leftSwipe)
                
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }

    func moveImg(sender: UISwipeGestureRecognizer){
        
        sfxFadeOut.play()
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            sender.view?.alpha = 0
            
            }) { (finished: Bool) -> Void in
                
                let cell = sender.view as! UICollectionViewCell
                let i = self.collectionView.indexPathForCell(cell)!.item
                self.savedScrabbleWords.append(self.deletedScrabbleWords[i])
                self.deletedScrabbleWords.removeAtIndex(i)
                self.savedScrabbleWords.sortInPlace({$0.word < $1.word})
                
                DataService.instance.addWords(self.savedScrabbleWords, deletedWord: self.deletedScrabbleWords)
                self.collectionView.reloadData()
                
        }
        
        
        

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
