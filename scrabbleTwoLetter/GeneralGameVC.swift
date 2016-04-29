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
    
    func headphones(button: UIButton){
        var buttonAlpha = DataService.instance.buttonAlphaLevel
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
