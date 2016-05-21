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
    var wrongAnswerCount: Int!
    var didSelectIncorrectAnswer: Bool!

    
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
    @IBOutlet weak var numberOfWords: UILabel!
    @IBOutlet weak var percentCorrectLbl: UILabel!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "timer", name: "correctDrop", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "badDropCounter", name: "wrongDrop", object: nil)
        
        headphones(headphonesImg)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        gameWords = DataService.instance.arrayOfGameWords
        
        allWords.shuffleInPlace()
        gameWords.shuffleInPlace()
        x = 0
        numberOfPlays = 0
        didSelectIncorrectAnswer = false
        wrongAnswerCount = 0
        
        
        
        
        if gameWords.count == 0 {
            print("0 called")
            button1.hidden = true
            button2.hidden = true
            button3.hidden = true
            button4.hidden = true
            imageStackView.hidden = true
            firstView.hidden = true
            secondView.hidden = true
            thirdView.hidden = true
            fourthView.hidden = true
            numberOfWords.hidden = true
            gameEnd.hidden = true
            zeroWords(true)
        } else{
            print("else called")
            button1.hidden = false
            button2.hidden = false
            button3.hidden = false
            button4.hidden = false
            imageStackView.hidden = false
            firstView.hidden = false
            secondView.hidden = false
            thirdView.hidden = false
            fourthView.hidden = false
            numberOfWords.hidden = false
            gameEnd.hidden = true
            zeroWords(false)
            reset()

        }
    }
    
    
    
    
    @IBAction func headphonesBtn (sender: UIButton){
        if DataService.instance.buttonAlphaLevel == 1{
            DataService.instance.updateButtonAlpha(0.5)
        } else{
            DataService.instance.updateButtonAlpha(1.0)
        }
        headphones(sender)
    }
    
    func badDropCounter(){
        didSelectIncorrectAnswer = true
    }
    
    func timer(){
        if startTimer != nil{
            startTimer.invalidate()
        }
        startTimer = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: "reset", userInfo: nil, repeats: false)
    }
    
    
    
    @IBAction func button1Action(sender: UIButton){
        print("1 called")
        if self.firstImg == self.imageArray[0]{
            print("1 correct")
            correctAnswer(sender)
        } else{
            print("1 incorrect")
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button2Action(sender: UIButton){
        if self.secondImg == self.imageArray[0]{
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button3Action(sender: UIButton){
        if self.thirdImg == self.imageArray[0]{
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button4Action(sender: UIButton){
        if self.fourthImg == self.imageArray[0]{
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    
    
    
    func correctAnswer(button: UIButton){
        
        deactivateButtons(button1, button2: button2, button3: button3, button4: button4)
        firstWord.textColor = UIColor(red: 20.0/255.0, green: 255.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        sfxCorrectAnswer.play()
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "reset", userInfo: nil, repeats: false)
    }
    
    
    func wrongAnswer(button: UIButton){
        
        didSelectIncorrectAnswer = true
        firstWord.textColor = UIColor.redColor()
        if sfxWrongAnswer.playing{
            sfxWrongAnswer.stop()
            sfxWrongAnswer.currentTime = 0
        }
        sfxWrongAnswer.play()
    }
    
    var imageArray: [UIImageView]!
    
    func reset(){
        
        if didSelectIncorrectAnswer == true{
            wrongAnswerCount = wrongAnswerCount + 1
        }
        
        if numberOfPlays == gameWords.count{
            
            percentCorrect(gameWords.count, wrongWordsCount: wrongAnswerCount, label: percentCorrectLbl)
            
            imageStackView.hidden = true
            firstWord.hidden = true
            gameEnd.hidden = false
            numberOfWords.hidden = true

            numberOfPlays = 0
            wrongAnswerCount = 0
            gameWords.shuffleInPlace()
            x = 0
            
        }
        
        didSelectIncorrectAnswer = false
        
        numberOfWords.text = "\(numberOfPlays + 1)/\(gameWords.count)"
        activateButtons(button1, button2: button2, button3: button3, button4: button4)
        
        
        button1.userInteractionEnabled = false
        button2.userInteractionEnabled = false
        button3.userInteractionEnabled = false
        button4.userInteractionEnabled = false
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.firstImg.alpha = 0
            self.secondImg.alpha = 0
            self.thirdImg.alpha = 0
            self.fourthImg.alpha = 0
            self.firstWord.alpha = 0
            
            
            }) { (Bool) -> Void in
                
                self.firstImg.alpha = 0
                self.secondImg.alpha = 0
                self.thirdImg.alpha = 0
                self.fourthImg.alpha = 0
                
                self.numberOfPlays = self.numberOfPlays + 1
                
                self.firstWord.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0)
                self.firstWord.userInteractionEnabled = true
                
                self.allWordsMinusOne = self.allWords
                self.allWordsMinusOne.shuffleInPlace()
                let currentWord = self.gameWords[self.x]
                self.x = self.x + 1
                
                self.firstWord.text = currentWord.word
                self.imageArray = [self.firstImg, self.secondImg, self.thirdImg, self.fourthImg]
                self.imageArray.shuffleInPlace()
                var y = 0
                for var x in self.allWordsMinusOne{
                    if x.word == currentWord.word{
                        self.allWordsMinusOne.removeAtIndex(y)
                        
                    }
                    y = y + 1
                }
                self.postImgs(currentWord.image, imgView: self.imageArray[0])
                self.postImgs(self.allWordsMinusOne[0].image, imgView: self.imageArray[1])
                self.postImgs(self.allWordsMinusOne[1].image, imgView: self.imageArray[2])
                self.postImgs(self.allWordsMinusOne[2].image, imgView: self.imageArray[3])
                
                if self.firstImg == self.imageArray[0]{
                    self.firstWord.dropTarget = self.firstView
                } else if self.secondImg == self.imageArray[0]{
                    self.firstWord.dropTarget = self.secondView
                } else if self.thirdImg == self.imageArray[0]{
                    self.firstWord.dropTarget = self.thirdView
                } else {
                    self.firstWord.dropTarget = self.fourthView
                }
                
                self.button1.userInteractionEnabled = true
                self.button2.userInteractionEnabled = true
                self.button3.userInteractionEnabled = true
                self.button4.userInteractionEnabled = true
                
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone,
                    
                    animations: { () -> Void in
                    
//                    self.firstImg.alpha = 1
//                    self.secondImg.alpha = 1
//                    self.thirdImg.alpha = 1
//                    self.fourthImg.alpha = 1
                    self.firstWord.alpha = 1
                    
                    }, completion: nil)
        }
    }
    

    
    
    
    
    func postImgs(image: String, imgView: UIImageView){
        ImageLoader.sharedLoader.imageForUrl(image, completionHandler: {(image: UIImage?, url: String)
            in
            
            imgView.image = image!
            
            if image != nil{
                imgView.image = image!
            } else {
                imgView.image = UIImage(named: "diff3")
            }
            
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone,
                
                animations: { () -> Void in
                    
                    imgView.alpha = 1.0
                }, completion: nil)
            
            
            
            
    })
    }

    
    @IBAction func homeButton(sender: AnyObject!){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func playAgain(sender: AnyObject!){
        imageStackView.hidden = false
        firstWord.hidden = false
        numberOfWords.hidden = false
        gameEnd.hidden = true
    }
    
    @IBAction func gameScreen(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func deleteWords(sender: AnyObject!){
        buttonAction()
    }
    
    @IBAction func backButton(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }

}
