//
//  ImageGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

class ImageGameVC: GeneralGameVC {
    
    var allWords = StoreWord().getWord()
    var allWordsMinusOne: [ScrabbleWord]!
    var gameWords: [ScrabbleWord]!
    var x: Int!
    var numberOfPlays: Int!
    var startTimer: NSTimer!
    
    @IBOutlet weak var firstWord: DragLabel!

    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var fourthImg: UIImageView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var imageStackView: UIStackView!
    
    @IBOutlet weak var gameEnd: UIStackView!
    
    @IBOutlet weak var headphonesImg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameWords = DataService.instance.savedWords
        
        allWords.shuffleInPlace()
        gameWords.shuffleInPlace()
        x = 0
        numberOfPlays = 0
        reset()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timer", name: "correctDrop", object: nil)
        
        headphones(headphonesImg)

    }
    

    
    @IBAction func headphonesBtn (sender: UIButton){
        if DataService.instance.buttonAlphaLevel == 1{
            DataService.instance.updateButtonAlpha(0.5)
        } else{
            DataService.instance.updateButtonAlpha(1.0)
        }
        headphones(sender)
    }
    
    func timer(){
        if startTimer != nil{
            startTimer.invalidate()
        }
        startTimer = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: "reset", userInfo: nil, repeats: false)
    }
    
    func reset(){
        
        if numberOfPlays == gameWords.count{
            
            imageStackView.hidden = true
            firstWord.hidden = true
            gameEnd.hidden = false
            numberOfPlays = 0
            
            gameWords.shuffleInPlace()
            x = 0
            
        }
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.firstImg.alpha = 0
            self.secondImg.alpha = 0
            self.thirdImg.alpha = 0
            self.fourthImg.alpha = 0
            self.firstWord.alpha = 0
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                    
                    self.numberOfPlays = self.numberOfPlays + 1
                    
                    self.firstWord.textColor = UIColor.blackColor()
                    self.firstWord.userInteractionEnabled = true
                    
                    self.allWordsMinusOne = self.allWords
                    self.allWordsMinusOne.shuffleInPlace()
                    let currentWord = self.gameWords[self.x]
                    self.x = self.x + 1
                    
                    self.firstWord.text = currentWord.word
                    var imageArray = [self.firstImg, self.secondImg, self.thirdImg, self.fourthImg]
                    imageArray.shuffleInPlace()
                    var y = 0
                    for var x in self.allWordsMinusOne{
                        if x.word == currentWord.word{
                            self.allWordsMinusOne.removeAtIndex(y)
                            
                        }
                        y = y + 1
                    }
                    self.postImgs(currentWord.image, imgView: imageArray[0])
                    self.postImgs(self.allWordsMinusOne[0].image, imgView: imageArray[1])
                    self.postImgs(self.allWordsMinusOne[1].image, imgView: imageArray[2])
                    self.postImgs(self.allWordsMinusOne[2].image, imgView: imageArray[3])
                    
                    if self.firstImg == imageArray[0]{
                        self.firstWord.dropTarget = self.firstView
                    } else if self.secondImg == imageArray[0]{
                        self.firstWord.dropTarget = self.secondView
                    } else if self.thirdImg == imageArray[0]{
                        self.firstWord.dropTarget = self.thirdView
                    } else {
                        self.firstWord.dropTarget = self.fourthView
                    }
                    
                    self.firstImg.alpha = 1
                    self.secondImg.alpha = 1
                    self.thirdImg.alpha = 1
                    self.fourthImg.alpha = 1
                    self.firstWord.alpha = 1
                    
                    }, completion: nil)
        }
    }
    
    func postImgs(image: String, imgView: UIImageView){
        ImageLoader.sharedLoader.imageForUrl(image, completionHandler: {(image: UIImage?, url: String)
            in
            imgView.image = image!
    })
    }

    
    @IBAction func homeButton(sender: AnyObject!){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func playAgain(sender: AnyObject!){
        imageStackView.hidden = false
        firstWord.hidden = false
        
        gameEnd.hidden = true
    }
    
    @IBAction func gameScreen(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func deleteWords(sender: AnyObject!){
        var jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController((jumpVC)!, animated: true)
        jumpVC?.selectedIndex = 0
    }
    
    @IBAction func backButton(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }

}
