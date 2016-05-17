//
//  ChooseCorrectWordGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/19/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class ChooseCorrectWordGameVC: GeneralGameVC {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var whichIsAWordLbl: UILabel!
    @IBOutlet weak var gameEnd: UIStackView!
    @IBOutlet weak var headphonesImg: UIButton!
    @IBOutlet weak var numberOfWords: UILabel!
    @IBOutlet weak var percentCorrectLbl: UILabel!
    
    var memorizingWords = [ScrabbleWord]()
    var fakeWords = ["Ac", "Af", "Ak", "Ap", "Av", "Br", "Ci", "Da", "Di", "Eg", "Ek", "Ew", "Fi", "Fo", "Ga", "Ge", "Gi", "Gu", "Hu", "Ia", "Ib", "Ie", "Ig", "Ik", "Il", "Im", "Io", "Ip", "Iz", "Ja", "Je", "Ji", "Ju", "Ke", "Ko", "Ku", "Le", "Lu", "Mr", "Ni", "Ny", "Oa", "Ob", "Og", "Ok", "Ot", "Oz", "Po", "Pu", "Py", "Qa", "Qo", "Ra", "Ri", "Ro", "Ru", "Ry", "Sa", "Se", "Sm", "Su", "Te", "Ts", "Tu", "Ub", "Ud", "Uf", "Ug", "Uk", "Ur", "Va", "Ve", "Vi", "Vo", "Vu", "Wa", "Wi", "Wy", "Wu", "Xa", "Xy", "Xo", "Yi", "Yu", "Ym", "Zo", "Zi"]
    
    var x: Int = 0
    var shortArray: [UIButton]!
    var memorizingWordsCount: Int!
    var wrongAnswerCount: Int!
    
    var didSelectIncorrectAnswer: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memorizingWords = DataService.instance.savedWords
        memorizingWords.shuffleInPlace()
        fakeWords.shuffleInPlace()
        memorizingWordsCount = memorizingWords.count
        
        didSelectIncorrectAnswer = false
        wrongAnswerCount = 0
        headphones(headphonesImg)
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
        if memorizingWords.count == 0{
            
            button1.hidden = true
            button2.hidden = true
            button3.hidden = true
            button4.hidden = true
            whichIsAWordLbl.hidden = true
            numberOfWords.hidden = true
            gameEnd.hidden = true

            zeroWords(true)
        } else{
            self.button1.hidden = false
            self.button2.hidden = false
            self.button3.hidden = false
            self.button4.hidden = false
            self.whichIsAWordLbl.hidden = false
            numberOfWords.hidden = false
            
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
            fakeWords.shuffleInPlace()
            button1.hidden = true
            button2.hidden = true
            button3.hidden = true
            button4.hidden = true
            numberOfWords.hidden = true
            whichIsAWordLbl.hidden = true
            gameEnd.hidden = false
            
            percentCorrect(memorizingWordsCount, wrongWordsCount: wrongAnswerCount, label: percentCorrectLbl)
            
            wrongAnswerCount = 0
            didSelectIncorrectAnswer = false
        }
        
        didSelectIncorrectAnswer = false
        
        numberOfWords.text = "\(x + 1)/\(memorizingWordsCount)"
        
        activateButtons(button1, button2: button2, button3: button3, button4: button4)
   
        let CurrentWord = memorizingWords[x]
        
        shortArray = [button1, button2, button3, button4]
        shortArray.shuffleInPlace()
        resetButtonColors()
        
        shortArray[0].setTitle(CurrentWord.word, forState: .Normal)
        shortArray[1].setTitle(fakeWords[0], forState: .Normal)
        shortArray[2].setTitle(fakeWords[1], forState: .Normal)
        shortArray[3].setTitle(fakeWords[2], forState: .Normal)
        fakeWords.shuffleInPlace()
        x = x + 1
    }
    
    func resetButtonColors(){
        button1.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button2.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button3.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button4.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
    }
    
    
    @IBAction func button1Action(sender: UIButton) {
        if (shortArray[0] == button1){
            print("You're correct!")
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button2Action(sender: UIButton) {
        if (shortArray[0] == button2){
            print("2nd is right!")
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button3Action(sender: UIButton) {
        if (shortArray[0] == button3){
            print("3rd is right!")
            correctAnswer(sender)

        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button4Action(sender: UIButton) {
        if (shortArray[0] == button4){
            print("4th is right!")
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }

    
    func correctAnswer(button: UIButton){
        
        deactivateButtons(button1, button2: button2, button3: button3, button4: button4)
        button.backgroundColor = UIColor(red: 26.0/255.0, green: 250.0/255.0, blue: 21.0/255.0, alpha: 1.0)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "resetGame", userInfo: nil, repeats: false)
        sfxCorrectAnswer.play()
    }
    
    
    func wrongAnswer(button: UIButton){
        
        didSelectIncorrectAnswer = true
        
        button.backgroundColor = UIColor(red: 229.0/255.0, green: 81.0/255.0, blue: 86.0/255.0, alpha: 1.0)
        sfxWrongAnswer.play()
    }
    
    
    
    @IBAction func playAgain(sender: AnyObject){
        
        self.gameEnd.hidden = true
        self.button1.hidden = false
        self.button2.hidden = false
        self.button3.hidden = false
        self.button4.hidden = false
        self.whichIsAWordLbl.hidden = false
        numberOfWords.hidden = false
        
//
//        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//            self.gameEnd.alpha = 0
//            }) { (finished: Bool) -> Void in
//                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//                    self.button1.hidden = false
//                    self.button2.hidden = false
//                    self.button3.hidden = false
//                    self.button4.hidden = false
//                    self.whichIsAWordLbl.hidden = false
//                    
//                    }, completion: nil)
//        }
    }
    
    
    
    
    
    @IBAction func gameScreen(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func removeSomeWords(sender: AnyObject){
        var jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController((jumpVC)!, animated: true)
        jumpVC?.selectedIndex = 1
    }
    
    @IBAction func backButton(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
