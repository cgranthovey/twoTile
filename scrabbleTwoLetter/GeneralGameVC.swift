//
//  GeneralGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralGameVC: UIViewController {

    var sfxCorrectAnswer: AVAudioPlayer!
    var sfxWrongAnswer: AVAudioPlayer!
    var buttonStatus: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()

    }
    
    override func viewDidAppear(animated: Bool) {
        sfxCorrectAnswer.volume = 0.4
        sfxWrongAnswer.volume = 0.4
    }
    
    
    func initAudio(){
        do {
            try sfxCorrectAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correctAnswer", ofType: "mp3")!))
            try sfxWrongAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrongAnswer", ofType: "mp3")!))
            

            
            sfxCorrectAnswer.prepareToPlay()
            sfxWrongAnswer.prepareToPlay()
            

            
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }

    func deactivateButtons(button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton){
        button1.userInteractionEnabled = false
        button2.userInteractionEnabled = false
        button3.userInteractionEnabled = false
        button4.userInteractionEnabled = false
    }
    
    func activateButtons(button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton){
        button1.userInteractionEnabled = true
        button2.userInteractionEnabled = true
        button3.userInteractionEnabled = true
        button4.userInteractionEnabled = true
    }
    
    func percentCorrect(memorizingWordCount: Int, wrongWordsCount: Int, label: UILabel){
        
        let percentCorrectOverTotal: Double = Double(memorizingWordCount - wrongWordsCount) / Double(memorizingWordCount)

        let percentage = Int(round(percentCorrectOverTotal * 100))
        
        if percentage == 0 {
            label.text = "0% - Hmmm.  You can do better than this!"
        } else if percentage <= 50{
            label.text = "\(percentage)% - maybe some more practice"
        } else if percentage <= 70{
            label.text = "\(percentage)% - at least you're above 50%"
        } else if percentage <= 90{
            label.text = "\(percentage)% - dang good job!"
        } else if percentage < 100{
            label.text = "\(percentage)% - Wow!  An 'A' student!"
        } else{
            label.text = "100% - Perfect! Awesome job!"
        }
    }
    
    func zeroWords(zeroWord: Bool){
        
        print("zero words called")
        var label:UILabel = UILabel(frame: CGRectMake(50, 145, 280, 350))
        self.view.addSubview(label)
        label.textAlignment = NSTextAlignment.Center
        label.center.x = self.view.center.x
        label.numberOfLines = 4
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        let font = UIFont(name: "Helvetica Neue", size: 18)
        label.font = font
        label.text = "You've already mastered all your two tile words!  Move words from the mastered tab to the learning tab to play."
        label.sizeToFit()
        label.numberOfLines = 0
        if zeroWord == true{
            print("it's true")
            label.hidden = false
        } else {
            print("it's false")
            label.hidden = true
        }
    }

    
    //            zeroSavedWordsLbl.text = "You've already mastered all your two tile words!  Move words from the mastered tab to the learning tab to play."

    
    
    
    
    func headphones(button: UIButton){
        let buttonAlpha = DataService.instance.buttonAlphaLevel
        if buttonAlpha != 1{
            self.sfxCorrectAnswer.volume = 0.0
            self.sfxWrongAnswer.volume = 0.0
            button.alpha = 0.5
        } else{
            self.sfxCorrectAnswer.volume = 1.0
            self.sfxWrongAnswer.volume = 1.0
            button.alpha = buttonAlpha
        }
    }
    


}
