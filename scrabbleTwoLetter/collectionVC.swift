//
//  collectionVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/12/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class collectionVC: GeneralCollectionVC, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var savedWords = [ScrabbleWord]()
    var deletedWords = [ScrabbleWord]()

    var sortedDeletedWords = [ScrabbleWord]()
    var myButton: UIButton!
    var myDeleteButtonArray: [UIButton]!
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        myDeleteButtonArray = [UIButton]()
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
//        collectionView.reloadData()                           this line was causing data to load twice, I think collection view auto reloads each time viewDidAppear.  This caused images to flash
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

            myButton = UIButton(frame: CGRectMake(77, 3, 20, 20))
            myButton.setBackgroundImage(UIImage(named: "cancelCircle"), forState: .Normal)
            myButton.tag = indexPath.row
            myButton.alpha = 0.6
            myButton.hidden = true
            myButton.contentMode = UIViewContentMode.ScaleAspectFit
            myButton.addTarget(self, action: "reset:", forControlEvents: .TouchUpInside)
            myDeleteButtonArray.append(myButton)
            cell.addSubview(myButton)
            
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
    
    func reset(button: UIButton) {
        self.sfxFadeOut.play()
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            
            button.superview?.alpha = 0
            
            }) { (finished: Bool) -> Void in
                let cell = button.superview as! UICollectionViewCell
                let i = self.collectionView.indexPathForCell(cell)!.item
                print("indexpath for cell\(i)")
                self.deletedWords.append(self.savedWords[i])
                self.savedWords.removeAtIndex(i)
                self.deletedWords.sortInPlace({$0.word < $1.word})
                
                DataService.instance.addWords(self.savedWords, deletedWord: self.deletedWords)
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
