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
    @IBOutlet weak var editBtnOutlet: UIButton!
    @IBOutlet weak var emptyCollectionViewStackView: UIStackView!
    
    var deletedScrabbleWords = [ScrabbleWord]()
    var savedScrabbleWords = [ScrabbleWord]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDeleteButtonArray = [UIButton]()
        collectionView.delegate = self
        collectionView.dataSource = self
        deletedScrabbleWords = DataService.instance.deletedWords
        savedScrabbleWords = DataService.instance.savedWords
        
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        deletedScrabbleWords = DataService.instance.deletedWords
        savedScrabbleWords = DataService.instance.savedWords
        myDeleteButtonArray = [UIButton]()

        collectionView.reloadData()   //this reload data seems to fully execute after the view will appear is completed
        
        if deletedScrabbleWords.count == 0{
            emptyCollectionViewStackView.hidden = false
        } else{
            emptyCollectionViewStackView.hidden = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        editButtonOnAppear()

    }
    
    func editButtonOnAppear(){
        if editBtnOutlet.titleForState(.Normal) == "Edit"{
            for x in myDeleteButtonArray{
                x.hidden = true
            }
        }else{
            for x in myDeleteButtonArray{
                x.hidden = false
            }
        }
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
            if editBtnOutlet.titleForState(.Normal) == "Done"{
                myButton.hidden = false
            } else {
                myButton.hidden = true
            }
            myButton.contentMode = UIViewContentMode.ScaleAspectFit
            myButton.addTarget(self, action: "moveImg:", forControlEvents: .TouchUpInside)
            print(myButton)
            myDeleteButtonArray.append(myButton)
            cell.addSubview(myButton)
            
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }

    @IBAction func editBtn(sender: UIButton) {
        print(myDeleteButtonArray.count)
        if sender.titleForState(.Normal) == "Edit"{
            sender.setTitle("Done", forState: .Normal)
            for x in myDeleteButtonArray{
                print(x)
                x.hidden = false
            }
        } else{
            sender.setTitle("Edit", forState: .Normal)
            for x in myDeleteButtonArray{
                x.hidden = true
            }
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        for x in myDeleteButtonArray{
            x.hidden = true
        }
    }
    
    func moveImg(button: UIButton){

        
        self.sfxFadeOut.play()
        
        
        let cell = button.superview as! UICollectionViewCell
        let i = self.collectionView.indexPathForCell(cell)!
        self.savedScrabbleWords.append(self.deletedScrabbleWords[i.item])
        self.deletedScrabbleWords.removeAtIndex(i.item)
        self.savedScrabbleWords.sortInPlace({$0.word < $1.word})

        DataService.instance.addWords(savedScrabbleWords, deletedWord: deletedScrabbleWords)
        self.collectionView.deleteItemsAtIndexPaths([i])
        
        
        
        
        
//        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//            
//            button.superview?.alpha = 0
//            
//            }) { (finished: Bool) -> Void in
//                
//                let cell = button.superview as! UICollectionViewCell
//                let i = self.collectionView.indexPathForCell(cell)!.item
//                self.savedScrabbleWords.append(self.deletedScrabbleWords[i])
//                self.deletedScrabbleWords.removeAtIndex(i)
//                self.savedScrabbleWords.sortInPlace({$0.word < $1.word})
//                
//                DataService.instance.addWords(self.savedScrabbleWords, deletedWord: self.deletedScrabbleWords)
//                self.collectionView.reloadData()
//        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
