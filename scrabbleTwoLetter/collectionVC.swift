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
    @IBOutlet weak var imgCongrats: UIImageView!
    @IBOutlet weak var congrats: UILabel!
    @IBOutlet weak var congrats2: UILabel!
    
    var savedWords = [ScrabbleWord]()
    var deletedWords = [ScrabbleWord]()

    var sortedDeletedWords = [ScrabbleWord]()
    var myButton: UIButton!
    var myDeleteButtonArray: [UIButton]!
    
    
    var arrayOfGameWords = [ScrabbleWord]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDeleteButtonArray = [UIButton]()
        collectionView.delegate = self
        collectionView.dataSource = self
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
        arrayOfGameWords = DataService.instance.arrayOfGameWords
        imgCongrats.clipsToBounds = true
        
    }

    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        
        savedWords = DataService.instance.savedWords
        deletedWords = DataService.instance.deletedWords
        myDeleteButtonArray = [UIButton]()

        collectionView.reloadData()                        //   this line was causing data to load twice, I think collection view auto reloads each time viewDidAppear.  This caused images to flash
        congratsStatus()
    }
    
    override func viewDidAppear(animated: Bool) {
//        editButtonOnAppear()
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.savedWords.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        changeColor(indexPath)
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
            
            cell.configureCell(savedWords[indexPath.row], gameWords: arrayOfGameWords)

            myButton = UIButton(frame: CGRectMake(50, -7, 49, 49))
            myButton.setBackgroundImage(UIImage(named: "cancelCircle"), forState: .Normal)
            myButton.tag = indexPath.row

            if editBtnOutlet.titleForState(.Normal) == "Done"{
                myButton.hidden = false
            } else {
                myButton.hidden = true
            }
            myButton.contentMode = UIViewContentMode.ScaleAspectFit
            myButton.addTarget(self, action: "reset:", forControlEvents: .TouchUpInside)
            myDeleteButtonArray.append(myButton)
            cell.addSubview(myButton)
        
            swipeRight = UISwipeGestureRecognizer(target: self, action: "toWordDetail:")
            swipeRight.direction = UISwipeGestureRecognizerDirection.Right
            cell.addGestureRecognizer(swipeRight)

            
            return cell
        } else {
            return UICollectionViewCell()
        }
}
    
    var swipeRight: UISwipeGestureRecognizer!
    
    
    func changeColor(indexPath: NSIndexPath){
        
        if let cell = collectionView?.cellForItemAtIndexPath(indexPath) as? WordCell{
            
            var z = 0
            for x in arrayOfGameWords{
                if x.word == savedWords[indexPath.item].word{
                    
                    if sfxBubble.playing || sfxBubble2.playing{
                        sfxBubble.stop()
                        sfxBubble2.stop()
                        sfxBubble.currentTime = 0
                        sfxBubble2.currentTime = 0
                    }
                    sfxBubble2.play()
                    
                    
                    arrayOfGameWords.removeAtIndex(z)
                    cell.colorForGameRemove()
                    DataService.instance.saveGameWords(arrayOfGameWords)
                    return
                }
                z = z + 1
            }
            
            if sfxBubble.playing || sfxBubble2.playing{
                sfxBubble.stop()
                sfxBubble2.stop()
                sfxBubble.currentTime = 0
                sfxBubble2.currentTime = 0
            }
            sfxBubble.play()
            
            arrayOfGameWords.append(savedWords[indexPath.item])
            cell.colorForGame()
            DataService.instance.saveGameWords(arrayOfGameWords)
            
        }
    }
    
    
    
    
    @IBAction func greenBucketPress(sender: UIButton){
        
        rotateBucket(sender)
        if sfxSplashShort.playing{
            sfxSplashShort.stop()
            sfxSplashShort.currentTime = 0
        }
        sfxSplashShort.play()
        arrayOfGameWords = [ScrabbleWord]()
        arrayOfGameWords = savedWords
        DataService.instance.saveGameWords(arrayOfGameWords)
        let cells = collectionView.visibleCells() as! [WordCell]
        for cell in cells{
            cell.colorForGame()
        }
            
        
    }
    
    @IBAction func blueBucketPress(sender: UIButton){
        rotateBucket(sender)
        if sfxSplashShort.playing{
            sfxSplashShort.stop()
            sfxSplashShort.currentTime = 0
        }
        sfxSplashShort.play()
        arrayOfGameWords = [ScrabbleWord]()
        DataService.instance.saveGameWords(arrayOfGameWords)
        let cells = collectionView.visibleCells() as! [WordCell]
        for cell in cells{
            cell.colorForGameRemove()
        }
    }
    
    func rotateBucket(bucketImg: UIButton){
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            bucketImg.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 2.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    bucketImg.transform = CGAffineTransformMakeRotation(CGFloat(0))
                    }, completion: nil)
        }
    }
    
    
    
    
    func toWordDetail(sender: UIGestureRecognizer){
        let cell = sender.view as! WordCell
        let i = self.collectionView.indexPathForCell(cell)!
        
        performSegueWithIdentifier("collectionToWordDetail", sender: DataService.instance.savedWords[i.item])
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
    
    override func viewDidDisappear(animated: Bool) {        //for some reason problems with the delete button were caused without this
        for x in myDeleteButtonArray{
            x.hidden = true
        }
    }
    
    

    var myDeleteButtonPressedArray = [UIButton]()
    
    func reset(button: UIButton) {
        self.sfxFadeOut.play()
        
        
        let cell = button.superview as! UICollectionViewCell
        let i = self.collectionView.indexPathForCell(cell)!
        
        var y = 0
        for x in arrayOfGameWords{
            if x.word == savedWords[i.item].word{
                arrayOfGameWords.removeAtIndex(y)
            }
            y = y + 1
        }
        
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
        congratsStatus()
        
        
        let holdPositionImgCongrats = imgCongrats.center.y
        var holdPositionCongrats = congrats.center.x
        var holdPositionCongrats2 = congrats2.center.x
        
        
        self.imgCongrats.center.y = self.view.frame.height * 1.5
        self.congrats.center.x = -self.view.frame.width * 1.5
        self.congrats2.center.x = -self.view.frame.width * 1.5
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 1.0, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.imgCongrats.center.y = holdPositionImgCongrats
            
            }, completion: {
                (finished: Bool) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.congrats.center.x = holdPositionCongrats
                    }, completion: nil)
                UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.congrats2.center.x = holdPositionCongrats2
                    }, completion: nil)
                
        })
    }
    
    func congratsStatus(){
        if savedWords.count == 0{
            self.imgCongrats.hidden = false
            self.congrats.hidden = false
            self.congrats2.hidden = false
        } else {
            self.imgCongrats.hidden = true
            self.congrats.hidden = true
            self.congrats2.hidden = true
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    @IBAction func backButton(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
