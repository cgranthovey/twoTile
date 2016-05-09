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
    @IBOutlet weak var editBtnOutlet: UIButton!
    @IBOutlet weak var emptyCollectionViewLbl: UILabel!
    
    var savedWords = [ScrabbleWord]()
    var deletedWords = [ScrabbleWord]()

    var sortedDeletedWords = [ScrabbleWord]()
    var myButton: UIButton!
    var myDeleteButtonArray: [UIButton]!
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        myDeleteButtonArray = [UIButton]()
        collectionView.delegate = self
        collectionView.dataSource = self
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
        print("view did load last")
    }

    
    
    override func viewWillAppear(animated: Bool) {
        print("view will appear")
        super.viewWillAppear(true)
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
        collectionView.reloadData()                        //   this line was causing data to load twice, I think collection view auto reloads each time viewDidAppear.  This caused images to flash
        myDeleteButtonArray = [UIButton]()
        if savedWords.count == 0{
            emptyCollectionViewLbl.hidden = false
        } else{
            emptyCollectionViewLbl.hidden = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        editButtonOnAppear()
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
        print("cell for item at index path called")

        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WordCell", forIndexPath: indexPath) as? WordCell{
            
            
            cell.configureCell(savedWords[indexPath.row])

            myButton = UIButton(frame: CGRectMake(77, 3, 20, 20))
            myButton.setBackgroundImage(UIImage(named: "cancelCircle"), forState: .Normal)
            myButton.tag = indexPath.row
            myButton.alpha = 0.7

            if editBtnOutlet.titleForState(.Normal) == "Done"{
                myButton.hidden = false
            } else {
                myButton.hidden = true
            }
            myButton.contentMode = UIViewContentMode.ScaleAspectFit
            myButton.addTarget(self, action: "reset:", forControlEvents: .TouchUpInside)
            myDeleteButtonArray.append(myButton)
            cell.addSubview(myButton)
        
            return cell
        } else {
            return UICollectionViewCell()
        }
}

    
    
    func editButtonOnAppear(){
        print("my delete button array count: \(myDeleteButtonArray.count)")
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
//                updateCollectionView()
            }
    }

    var myDeleteButtonPressedArray = [UIButton]()
    
    @IBOutlet weak var imgCongrats: UIImageView!
    
    func reset(button: UIButton) {
        self.sfxFadeOut.play()
        
        
        let cell = button.superview as! UICollectionViewCell
        let i = self.collectionView.indexPathForCell(cell)!
        self.deletedWords.append(self.savedWords[i.item])
        self.savedWords.removeAtIndex(i.item)
        self.deletedWords.sortInPlace({$0.word < $1.word})
        DataService.instance.addWords(savedWords, deletedWord: deletedWords)
        self.collectionView.deleteItemsAtIndexPaths([i])
        
        if savedWords.count == 0{
            animateCongrats()
        }
    }
    
    func animateCongrats(){
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.imgCongrats.layer.position = CGPoint(x: self.view.frame.size.height, y: 0)
            }, completion: nil)
    }
    
    
    
    
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
        
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
