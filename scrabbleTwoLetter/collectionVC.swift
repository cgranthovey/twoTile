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
    
    var savedWords = [ScrabbleWord]()
    var deletedWords = [ScrabbleWord]()

    var sortedDeletedWords = [ScrabbleWord]()
    var myButton: UIButton!
    var myDeleteButtonArray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDeleteButtonArray = [UIButton]()
        collectionView.delegate = self
        collectionView.dataSource = self
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
        collectionView.reloadData()                        //   this line was causing data to load twice, I think collection view auto reloads each time viewDidAppear.  This caused images to flash
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
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WordCell", forIndexPath: indexPath) as? WordCell{
            cell.configureCell(savedWords[indexPath.row])

            myButton = UIButton(frame: CGRectMake(77, 3, 20, 20))
            myButton.setBackgroundImage(UIImage(named: "cancelCircle"), forState: .Normal)
            myButton.tag = indexPath.row
            myButton.alpha = 0.7
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
    
    func reset(button: UIButton) {
        self.sfxFadeOut.play()
        
        
        let cell = button.superview as! UICollectionViewCell
        let i = self.collectionView.indexPathForCell(cell)!
        self.deletedWords.append(self.savedWords[i.item])
        self.savedWords.removeAtIndex(i.item)
        self.deletedWords.sortInPlace({$0.word < $1.word})
        DataService.instance.addWords(savedWords, deletedWord: deletedWords)
        self.collectionView.deleteItemsAtIndexPaths([i])
        
//        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//            
//            button.superview?.alpha = 0
//            
//            }) { (finished: Bool) -> Void in
//       
//                self.myDeleteButtonPressedArray.append(button)
//                print("mydelete button pressed array \(self.myDeleteButtonPressedArray.count)")
//        }
    }
    
//    func updateCollectionView(){
//        
//        var iHolder = [Int]()
//        
//        var holdIndexPath = [NSIndexPath]()
//        
//        for button in myDeleteButtonPressedArray{
//            let cell = button.superview as! UICollectionViewCell
//            
//            holdIndexPath.append(self.collectionView.indexPathForCell(cell)!)
//            let i = self.collectionView.indexPathForCell(cell)!.item
//            
//            iHolder.append(i)
//            print("i \(i)")
//        }
//        
//        self.collectionView.deleteItemsAtIndexPaths(holdIndexPath)
//        
//        iHolder.sortInPlace()
//        let hold = iHolder.reverse()
//        
//        for i in hold{
//            self.deletedWords.append(self.savedWords[i])
//            self.deletedWords.sortInPlace({$0.word < $1.word})
//            self.savedWords.removeAtIndex(i)
//            DataService.instance.addWords(self.savedWords, deletedWord: self.deletedWords)
//        }
//        
//        savedWords = DataService.instance.savedWords
//        deletedWords = DataService.instance.deletedWords
//        collectionView.reloadData()
//        myDeleteButtonPressedArray = [UIButton]()
//    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
        
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
