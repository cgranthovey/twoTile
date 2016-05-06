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
    
    var deletedScrabbleWords = [ScrabbleWord]()
    var savedScrabbleWords = [ScrabbleWord]()
    
    override func viewDidLoad() {
        print("1")
        super.viewDidLoad()
        print("2")
        collectionView.delegate = self
        print("3")
        collectionView.dataSource = self
        print("4")
        myDeleteButtonArray = [UIButton]()
        print("5")
        
        deletedScrabbleWords = DataService.instance.deletedWords
        print("6")
        savedScrabbleWords = DataService.instance.savedWords
        print("7")
        print("deleted scrabble words count \(deletedScrabbleWords.count)")
        print("8")
        collectionView.reloadData()
        print("9")
        
        
    }

    override func viewWillAppear(animated: Bool) {
        print("10")
        super.viewWillAppear(true)
        print("11")
        deletedScrabbleWords = DataService.instance.deletedWords
        savedScrabbleWords = DataService.instance.savedWords
        print("deleted scrabble words count \(deletedScrabbleWords.count)")

        collectionView.reloadData()
        
    }
   
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.deletedWords.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("collectionToWordDetail2", sender: DataService.instance.deletedWords[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectionToWordDetail2"{
            if let controller = segue.destinationViewController as? WordDetail{
                if let tempWord = sender as? ScrabbleWord{
                    controller.tappedWord = tempWord
                }
            }
        }
    }
    
    
    var myButton: UIButton!
    var myDeleteButtonArray: [UIButton]!
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WordCell", forIndexPath: indexPath) as? WordCell{
            cell.configureCell(deletedScrabbleWords[indexPath.row])
            
            myButton = UIButton(frame: CGRectMake(67, 0, 30, 30))
            myButton.setBackgroundImage(UIImage(named: "backArrowFilledBlack"), forState: .Normal)
            myButton.tag = indexPath.row
            myButton.alpha = 0.8
            myButton.hidden = true
            myButton.contentMode = UIViewContentMode.ScaleAspectFit
            myButton.addTarget(self, action: "moveImg:", forControlEvents: .TouchUpInside)
            myDeleteButtonArray.append(myButton)
            cell.addSubview(myButton)
            
            print("I'm creating a beautiful cell!")
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }

    
    @IBAction func editBtn(sender: UIButton) {
        
        if sender.titleForState(.Normal) == "Edit"{
            sender.setTitle("Done", forState: .Normal)
            for x in myDeleteButtonArray{
                x.hidden = false
            }
        } else{
            sender.setTitle("Edit", forState: .Normal)
            for x in myDeleteButtonArray{
                x.hidden = true
            }
        }
        
    }
    
    
    func moveImg(button: UIButton){
        
        sfxFadeOut.play()
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            button.superview?.alpha = 0
            
            }) { (finished: Bool) -> Void in
                
                let cell = button.superview as! UICollectionViewCell
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
