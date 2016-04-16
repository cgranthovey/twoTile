//
//  collectionVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/12/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class collectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var allWords = [ScrabbleWord]()
    var savedWords = [ScrabbleWord]()
    var deletedWords = [ScrabbleWord]()

    var sortedDeletedWords = [ScrabbleWord]()
    
    override func viewDidLoad() {
        
        allWords = StoreWord().getWord()
        
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        DataService.instance.loadPosts()
        if DataService.instance.deletedWords.count == 0{

            DataService.instance.addWords(allWords, deletedWord: [ScrabbleWord]())
        }
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
 
    }    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.savedWords.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("collectionToWordDetail", sender: DataService.instance.savedWords[indexPath.row])
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectionToWordDetail"{
            if let controller = segue.destinationViewController as? WordDetail{
                if let tempWord = sender as? ScrabbleWord{
                    controller.tappedWord = tempWord
                }
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WordCell", forIndexPath: indexPath) as? WordCell{
            cell.configureCell(DataService.instance.savedWords[indexPath.row])
            

            
            let cSelector = Selector("reset:")
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: cSelector )
            leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
            cell.addGestureRecognizer(leftSwipe)
                
                
            let iSelector = Selector("addImage:")
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: iSelector)
            rightSwipe.direction = .Right
            cell.addGestureRecognizer(rightSwipe)
            
            
            return cell
        } else {
            return UICollectionViewCell()
        }
}
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
    }
    
    
    func addImage(sender: UISwipeGestureRecognizer) {
        let cell = sender.view as! UICollectionViewCell as? WordCell
        let i = self.collectionView.indexPathForCell(cell!)!.item
        cell!.addImageToCell(DataService.instance.savedWords[i])
    }
    
    func reset(sender: UISwipeGestureRecognizer) {
        let cell = sender.view as! UICollectionViewCell
        let i = self.collectionView.indexPathForCell(cell)!.item
        
        deletedWords.append(savedWords[i])
        savedWords.removeAtIndex(i)
        
        deletedWords.sortInPlace({$0.word < $1.word})

        DataService.instance.addWords(savedWords, deletedWord: deletedWords)
        
        collectionView.reloadData()

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    var collectionViewCell: UICollectionViewCell!
    @IBAction func popToRoot(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
