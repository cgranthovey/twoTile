//
//  DefGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/21/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class DefGameVC: GeneralGameVC {

    
    @IBOutlet weak var tileWord: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var gameEnd: UIStackView!
    
    @IBOutlet weak var headphonesImg: UIButton!
    
    @IBOutlet weak var numberOfWords: UILabel!
    @IBOutlet weak var percentCorrectLbl: UILabel!
    
    
    var memorizingWords = [ScrabbleWord]()
    var x: Int!
    var buttonArray = [UILabel]()
    var memorizingWordsCount: Int!
    var wrongAnswerCount: Int!

    var didSelectIncorrectAnswer: Bool!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        memorizingWords = DataService.instance.savedWords
        memorizingWords.shuffleInPlace()
        x = 0
        memorizingWordsCount = memorizingWords.count
        didSelectIncorrectAnswer = false
        wrongAnswerCount = 0
        headphones(headphonesImg)

        
    }
    
    override func viewWillAppear(animated: Bool) {
        if memorizingWordsCount == 0 {
            button1.hidden = true
            button2.hidden = true
            button3.hidden = true
            button4.hidden = true
            label1.hidden = true
            label2.hidden = true
            label3.hidden = true
            label4.hidden = true
            numberOfWords.hidden = true
            tileWord.hidden = true
            gameEnd.hidden = true
            
            zeroWords(true)
        } else{
            button1.hidden = false
            button2.hidden = false
            button3.hidden = false
            button4.hidden = false
            label1.hidden = false
            label2.hidden = false
            label3.hidden = false
            label4.hidden = false
            numberOfWords.hidden = false
            tileWord.hidden = false
            gameEnd.hidden = true
            
            zeroWords(false)
            resetGame()

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
    
    func resetGame(){
        
        if didSelectIncorrectAnswer == true{
            wrongAnswerCount = wrongAnswerCount + 1
        }
        
        if x == memorizingWordsCount{
            x = 0
            
            memorizingWords.shuffleInPlace()
            button1.hidden = true
            button2.hidden = true
            button3.hidden = true
            button4.hidden = true
            label1.hidden = true
            label2.hidden = true
            label3.hidden = true
            label4.hidden = true
            tileWord.hidden = true
            numberOfWords.hidden = true
            
            percentCorrect(memorizingWordsCount, wrongWordsCount: wrongAnswerCount, label: percentCorrectLbl)
            
            wrongAnswerCount = 0
            didSelectIncorrectAnswer = false
            
            gameEnd.hidden = false
            
        }
        

        
        numberOfWords.text = "\(x + 1)/\(memorizingWordsCount)"
        didSelectIncorrectAnswer = false
        
        activateButtons(button1, button2: button2, button3: button3, button4: button4)
        var currentWord = memorizingWords[x]
        
        
        var allWords = StoreWord().getWord()
        var allWordsMinusOne = allWords
        var y = 0
        for x in allWords{
            if x.word == currentWord.word{
                allWordsMinusOne.removeAtIndex(y)
            }
            y = y + 1
        }
        allWordsMinusOne.shuffleInPlace()
        
        resetButtonColors()
        x = x + 1
        
        buttonArray = [label1, label2, label3, label4]
        buttonArray.shuffleInPlace()
        
        tileWord.text = currentWord.word
        buttonArray[0].text = currentWord.definition
        buttonArray[1].text = allWordsMinusOne[0].definition
        print(allWordsMinusOne[1].word)
        print(allWords.count)
        buttonArray[2].text = allWordsMinusOne[1].definition
        print(allWordsMinusOne[2].word)
        buttonArray[3].text = allWordsMinusOne[2].definition
    }
    
    @IBAction func button1Action(sender: UIButton!){
        if label1 == buttonArray[0]{
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button2Action(sender: UIButton!){
        if label2 == buttonArray[0]{
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button3Action(sender: UIButton!){
        if label3 == buttonArray[0]{
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button4Action(sender: UIButton!){
        if label4 == buttonArray[0]{
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }

    
    func resetButtonColors(){
        button1.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button2.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button3.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button4.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
    }
    
    func correctAnswer(button: UIButton){
        button.backgroundColor = UIColor(red: 20.0/255.0, green: 255.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "resetGame", userInfo: nil, repeats: false)
        sfxCorrectAnswer.play()
        deactivateButtons(button1, button2: button2, button3: button3, button4: button4)
    }

    
    func wrongAnswer(button: UIButton){
        didSelectIncorrectAnswer = true
        button.backgroundColor = UIColor.redColor()
        if sfxWrongAnswer.playing == true{
            sfxWrongAnswer.stop()
        }
        sfxWrongAnswer.play()
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
    
    @IBAction func playAgain(sender: AnyObject){
        button1.hidden = false
        button2.hidden = false
        button3.hidden = false
        button4.hidden = false
        label1.hidden = false
        label2.hidden = false
        label3.hidden = false
        label4.hidden = false
        tileWord.hidden = false
        numberOfWords.hidden = false
        
        gameEnd.hidden = true
    }
    
    @IBAction func gameScreen(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func removeSomeWords(sender: AnyObject){
        let jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController(jumpVC!, animated: true)
        jumpVC?.selectedIndex = 1
    }
    
    @IBAction func backButton(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    

}
