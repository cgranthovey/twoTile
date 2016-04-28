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
    
    var memorizingWords = [ScrabbleWord]()
    var x: Int!
    var buttonArray = [UILabel]()
    var memorizingWordsCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memorizingWords = DataService.instance.savedWords
        memorizingWords.shuffleInPlace()
        x = 0
        memorizingWordsCount = memorizingWords.count

        resetGame()
        

    }
    
    func resetGame(){
        
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
            
            gameEnd.hidden = false
            
        }
        
        activateButtons(button1, button2: button2, button3: button3, button4: button4)
        var currentWord = memorizingWords[x]
        var otherChoices = memorizingWords
        otherChoices.removeAtIndex(x)
        otherChoices.shuffleInPlace()
        resetButtonColors()
        x = x + 1
        
        buttonArray = [label1, label2, label3, label4]
        buttonArray.shuffleInPlace()
        
        tileWord.text = currentWord.word
        buttonArray[0].text = currentWord.definition
        buttonArray[1].text = otherChoices[0].definition
        buttonArray[2].text = otherChoices[1].definition
        buttonArray[3].text = otherChoices[2].definition
        print(label3.text)
        print(label4.text)
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
        button.backgroundColor = UIColor.redColor()
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
        
        gameEnd.hidden = true
    }
    
    @IBAction func gameScreen(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func removeSomeWords(sender: AnyObject){
        var jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController(jumpVC!, animated: true)
        jumpVC?.selectedIndex = 0
    }
    
    @IBAction func backButton(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    

}
