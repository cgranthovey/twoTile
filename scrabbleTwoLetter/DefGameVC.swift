//
//  DefGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/21/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class DefGameVC: UIViewController {

    
    @IBOutlet weak var tileWord: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var memorizingWords = [ScrabbleWord]()
    var x: Int!
    var buttonArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memorizingWords = DataService.instance.savedWords
        memorizingWords.shuffleInPlace()
        x = 0
        resetGame()
        

    }

    
    
    
    func resetGame(){
        
        
        var currentWord = memorizingWords[x]
        var otherChoices = memorizingWords
        otherChoices.removeAtIndex(x)
        otherChoices.shuffleInPlace()
        resetButtonColors()
        x = x + 1
        
        buttonArray = [button1, button2, button3, button4]
        buttonArray.shuffleInPlace()
        
        tileWord.text = currentWord.word
        buttonArray[0].setTitle(currentWord.definition, forState: .Normal)
        buttonArray[1].setTitle(otherChoices[0].definition, forState: .Normal)
        buttonArray[2].setTitle(otherChoices[1].definition, forState: .Normal)
        buttonArray[3].setTitle(otherChoices[2].definition, forState: .Normal)
    }
    
    
    @IBAction func button1Action(sender: MultipleChoiceButton!){
        if button1 == buttonArray[0]{
            correctAnswer(sender)
        } else{
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button2Action(sender: MultipleChoiceButton!){
        if button2 == buttonArray[0]{
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button3Action(sender: MultipleChoiceButton!){
        if button3 == buttonArray[0]{
            correctAnswer(sender)
        } else {
            wrongAnswer(sender)
        }
    }
    
    @IBAction func button4Action(sender: MultipleChoiceButton!){
        if button4 == buttonArray[0]{
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

    }
    
    func wrongAnswer(button: UIButton){
        button.backgroundColor = UIColor.redColor()
    }
    
    
    

}
