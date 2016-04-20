//
//  ChooseCorrectWordGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/19/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class ChooseCorrectWordGameVC: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var memorizingWords = [ScrabbleWord]()
    var fakeWords = ["Ac", "Af", "Ak", "Ap", "Av", "Br", "Ci", "Da", "Di", "Eg", "Ek", "Ew", "Fi", "Fo", "Ga", "Ge", "Gi", "Gu", "Hu", "Ia", "Ib", "Ie", "Ig", "Ik", "Il", "Im", "Io", "Ip", "Ja", "Je", "Ji", "Ju", "Ke", "Ko", "Ku", "Le", "Lu", "Mr", "Ni", "Ny", "Oa", "Ob", "Og", "Ok", "Ot", "Oz", "Po", "Pu", "Py", "Qa", "Qo", "Ra", "Ri", "Ro", "Ru", "Ry", "Sa", "Se", "Sm", "Su", "Te", "Ts", "Tu", "Ub", "Ud", "Uf", "Ug", "Uk", "Ur", "Va", "Ve", "Vi", "Vo", "Vu", "Wa", "Wi", "Wy", "Wu", "Xa", "Xy", "Xo", "Yi", "Yu", "Ym", "Zo", "Zi"]
    
    var x: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memorizingWords = DataService.instance.savedWords
        memorizingWords.shuffleInPlace()
        fakeWords.shuffleInPlace()
        resetGame()


    }
    
    override func viewDidAppear(animated: Bool) {

    }
    
    var shortArray: [UIButton]!

    func resetGame(){

        var CurrentWord = memorizingWords[x]
        
        shortArray = [button1, button2, button3, button4]
        shortArray.shuffleInPlace()
        
        button1.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button2.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button3.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        button4.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        shortArray[0].setTitle(CurrentWord.word, forState: .Normal)
        shortArray[1].setTitle(fakeWords[0], forState: .Normal)
        shortArray[2].setTitle(fakeWords[1], forState: .Normal)
        shortArray[3].setTitle(fakeWords[2], forState: .Normal)
        fakeWords.shuffleInPlace()
        x = x + 1
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
        button.backgroundColor = UIColor(red: 20.0/255.0, green: 255.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "resetGame", userInfo: nil, repeats: false)
    }
    
    
    func wrongAnswer(button: UIButton){
        
        button.backgroundColor = UIColor.redColor()
        
//        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//            button.backgroundColor = UIColor.redColor()
//            }, completion: { (finished: Bool) -> Void in
//                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
//                    button.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
//                    }, completion: nil)
//        })
    }
    
}
