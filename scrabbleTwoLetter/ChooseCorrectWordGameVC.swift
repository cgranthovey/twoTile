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
    var fakeWords = ["Ac", "Af", "Ak", "Ap", "Av", "Br", "Ci", "Da", "Di", "Eg", "Ek", "Ew", "Fi", "Fo", "Ga", "Ge", "Gi", "Go", "Gu", "Hu", "Ia", "Ib", "Ie", "Ig", "Ik", "Il", "Im", "Io", "Ip", "Ja", "Je", "Ji", "Ju", "Ke", "Ko", "Ku", "Le", "Lu", "Mr", "Ni", "Ny", "Oa", "Ob", "Og", "Ok", "Ot", "Oz", "Po", "Pu", "Py", "Qa", "Qo", "Ra", "Ri", "Ro", "Ru", "Ry", "Sa", "Se", "Sm", "Su", "Te", "Ts", "Tu", "Ub", "Ud", "Uf", "Ug", "Uk", "Ur", "Va", "Ve", "Vi", "Vo", "Vu", "Wa", "Wi", "Wy", "Wu", "Xa", "Xy", "Xo", "Yi", "Yu", "Ym", "Zo", "Zi"]
    
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
        var x = 0
        var CurrentWord = memorizingWords[x]
        
        shortArray = [button1, button2, button3, button4]
        shortArray.shuffleInPlace()
        
        shortArray[0].setTitle(CurrentWord.word, forState: .Normal)
        shortArray[1].setTitle(fakeWords[0], forState: .Normal)
        shortArray[2].setTitle(fakeWords[1], forState: .Normal)
        shortArray[3].setTitle(fakeWords[2], forState: .Normal)
        
        
    }
    
    
    @IBAction func button1Action(sender: AnyObject) {
        if (shortArray[0] == button1){
            print("You're correct!")
        }
    }
    
    @IBAction func button2Action(sender: AnyObject) {
        if (shortArray[0] == button2){
            print("2nd is right!")
        }
    }
    
    @IBAction func button3Action(sender: AnyObject) {
        if (shortArray[0] == button3){
            print("3rd is right!")
        }
    }
    
    @IBAction func button4Action(sender: AnyObject) {
        if (shortArray[0] == button4){
            print("4th is right!")
        }
    }
    
}
