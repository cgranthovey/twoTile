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
    var sfxSadTrombone: AVAudioPlayer!
    var sfxHappyDrum: AVAudioPlayer!
    var sfxSadDrum: AVAudioPlayer!
    var sfxCrowdCheer: AVAudioPlayer!
    var sfxOrganSad: AVAudioPlayer!
    var sfxDrumSemiFun: AVAudioPlayer!
    
    var buttonStatus: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()

    }
    
    override func viewDidAppear(animated: Bool) {
        sfxSadTrombone.volume = 0.4
        sfxCorrectAnswer.volume = 0.4
        sfxWrongAnswer.volume = 0.4
        sfxHappyDrum.volume = 0.6
        sfxSadDrum.volume = 0.4
        sfxCrowdCheer.volume = 0.4
        sfxOrganSad.volume = 0.4
        sfxDrumSemiFun.volume = 0.5
    }
    
    
    func initAudio(){
        do {
            try sfxCorrectAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct2", ofType: "wav")!))
            try sfxWrongAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong2", ofType: "mp3")!))
            try sfxSadTrombone = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sadTrombone", ofType: "wav")!))
            try sfxHappyDrum = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("happyDrum", ofType: "mp3")!))
            try sfxSadDrum = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("drumSad", ofType: "mp3")!))
            try sfxCrowdCheer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("crowdCheer", ofType: "mp3")!))
            try sfxOrganSad = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("organSad", ofType: "wav")!))
            try sfxDrumSemiFun = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("drumSemiFun", ofType: "mp3")!))
            
            sfxDrumSemiFun.prepareToPlay()
            sfxOrganSad.prepareToPlay()
            sfxCrowdCheer.prepareToPlay()
            sfxSadDrum.prepareToPlay()
            sfxHappyDrum.prepareToPlay()
            sfxSadTrombone.prepareToPlay()
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
            sfxSadTrombone.play()
        } else if percentage <= 50{
            label.text = "\(percentage)% - maybe some more practice"
            sfxOrganSad.play()
        } else if percentage <= 70{
            label.text = "\(percentage)% - at least you're above 50%"
            sfxSadDrum.play()
        } else if percentage <= 90{
            sfxDrumSemiFun.play()
            label.text = "\(percentage)% - dang good job!"
        } else if percentage < 100{
            sfxHappyDrum.play()
            label.text = "\(percentage)% - Wow!  An 'A' student!"
        } else{
            sfxCrowdCheer.play()
            label.text = "100% - Perfect! Awesome job!"
        }
    }
    
    func zeroWords(zeroWord: Bool){
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
            label.hidden = false
        } else {
            label.hidden = true
        }
    }

    
    //            zeroSavedWordsLbl.text = "You've already mastered all your two tile words!  Move words from the mastered tab to the learning tab to play."

    
    
    
    
    func headphones(button: UIButton){
        let buttonAlpha = DataService.instance.buttonAlphaLevel
        if buttonAlpha != 1{
            sfxSadTrombone.volume = 0.0
            sfxCorrectAnswer.volume = 0.0
            sfxWrongAnswer.volume = 0.0
            sfxHappyDrum.volume = 0.0
            sfxSadDrum.volume = 0.0
            sfxCrowdCheer.volume = 0.0
            sfxOrganSad.volume = 0.0
            sfxCorrectAnswer.volume = 0.0
            button.alpha = 0.5
        } else{
            sfxSadTrombone.volume = 0.4
            sfxCorrectAnswer.volume = 0.4
            sfxWrongAnswer.volume = 0.4
            sfxHappyDrum.volume = 0.6
            sfxSadDrum.volume = 0.4
            sfxCrowdCheer.volume = 0.4
            sfxOrganSad.volume = 0.4
            sfxCorrectAnswer.volume = 0.5
            button.alpha = buttonAlpha
        }
    }
    


}
