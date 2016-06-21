//
//  GeneralGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/28/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralGameVC: genVC {

    var sfxCorrectAnswer: AVAudioPlayer!
    var sfxWrongAnswer: AVAudioPlayer!
    var sfxSadTrombone: AVAudioPlayer!
    var sfxHappyDrum: AVAudioPlayer!
    var sfxSadDrum: AVAudioPlayer!
    var sfxCrowdCheer: AVAudioPlayer!
    var sfxOrganSad: AVAudioPlayer!
    var sfxDrumSemiFun: AVAudioPlayer!
    
    var buttonStatus: Int!
    var label: UILabel!
    var buttonToWords: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()
        
        label = UILabel(frame: CGRectMake(50, 160, 250, 350))
        self.view.addSubview(label)
        label.textAlignment = NSTextAlignment.Center
        label.center.x = self.view.center.x
        label.numberOfLines = 4
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        let font = UIFont(name: "Helvetica Neue", size: 18)
        label.font = font
        label.text = "No words are currently selected to practice in games."
        label.sizeToFit()
        label.numberOfLines = 0
        
        buttonToWords = UIButton(type: UIButtonType.System) as UIButton
        buttonToWords.frame = CGRectMake(10, 210, 120, 30)
        buttonToWords.setTitle("Add Words", forState: UIControlState.Normal)
        buttonToWords.addTarget(self, action: #selector(GeneralGameVC.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonToWords)
        
        buttonToWords.center.x = self.view.center.x
        let font1 = UIFont(name: "Helvetica Neue", size: 14)
        buttonToWords.titleLabel?.font = font1
    }
    
    override func viewDidAppear(animated: Bool) {
        soundStatus()
    }
    
    func initAudio(){
        do {
            try sfxCorrectAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct", ofType: "wav")!))
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
        
        if percentage < 20 {
            label.text = "0% - Hmmm.  You can do better than this!"
            sfxSadTrombone.play()
        } else if percentage < 40{
            label.text = "\(percentage)% - maybe some more practice"
            sfxOrganSad.play()
        } else if percentage < 60{
            label.text = "\(percentage)% - Let's get better"
            sfxSadDrum.play()
        } else if percentage < 80{
            sfxDrumSemiFun.play()
            label.text = "\(percentage)% - You're getting the hang of this!"
        } else if percentage < 100{
            sfxHappyDrum.play()
            label.text = "\(percentage)% - Wow!  You're doing great!"
        } else{
            sfxCrowdCheer.play()
            label.text = "100% - Perfect! Awesome job!"
        }
    }
    
    func zeroWords(zeroWord: Bool){
        if zeroWord == true{
            buttonToWords.alpha = 1
            buttonToWords.userInteractionEnabled = true
            label.alpha = 1
        } else {
            buttonToWords.alpha = 0
            buttonToWords.userInteractionEnabled = false
            label.alpha = 0
        }
    }
    
    func random20() -> [ScrabbleWord]{
        var holdWords = [ScrabbleWord]()
        holdWords = StoreWord().getWord()
        holdWords.shuffleInPlace()
        let returnWords: [ScrabbleWord] = Array(holdWords.prefix(20))
        return returnWords
    }

    func buttonAction(){
        performSegueWithIdentifier("gameToAddWordsSegue", sender: nil)
    }
    
    func soundStatus(){
        if DataService.instance.volumeOn == true{
            sfxSadTrombone.volume = 0.4
            sfxCorrectAnswer.volume = 0.3
            sfxWrongAnswer.volume = 0.35
            sfxHappyDrum.volume = 0.55
            sfxDrumSemiFun.volume = 0.65
            sfxSadDrum.volume = 0.4
            sfxCrowdCheer.volume = 0.35
            sfxOrganSad.volume = 0.45
        } else {
            sfxSadTrombone.volume = 0.0
            sfxCorrectAnswer.volume = 0.0
            sfxWrongAnswer.volume = 0.0
            sfxHappyDrum.volume = 0.0
            sfxSadDrum.volume = 0.0
            sfxCrowdCheer.volume = 0.0
            sfxOrganSad.volume = 0.0
            sfxDrumSemiFun.volume = 0.0
        }
    }
}