//
//  GeneralCollectionVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/29/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import AVFoundation

class GeneralCollectionVC: UIViewController {

    var sfxFadeOut: AVAudioPlayer!
    var sfxSplashShort: AVAudioPlayer!
    var sfxBubble: AVAudioPlayer!
    var sfxBubble2: AVAudioPlayer!
    var xPlacementOfX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()
        screenSizeForButton()
    }
    
    func screenSizeForButton(){
        let screenSize = UIScreen.mainScreen().bounds.height
        if screenSize <= 568{
            xPlacementOfX = 50
        } else if screenSize <= 667{
            xPlacementOfX = 63
        } else{
            xPlacementOfX = 71
        }
    }

    func initAudio(){
        do{
            try sfxFadeOut = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fadeWord", ofType: "wav")!))

            try sfxSplashShort = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("rockSplashShort", ofType: "mp3")!))
            try sfxBubble = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("waterDropSlash", ofType: "mp3")!))
            try sfxBubble2 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("pebbleDrop1", ofType: "mp3")!))

            sfxFadeOut.prepareToPlay()
            sfxSplashShort.prepareToPlay()
            sfxBubble.prepareToPlay()
            sfxBubble2.prepareToPlay()
            volume()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func volume(){
        if DataService.instance.volumeOn == true{
            sfxFadeOut.volume = 3
            sfxSplashShort.volume = 0.2
            sfxBubble.volume = 0.1
            sfxBubble2.volume = 0.1
        } else {
            sfxFadeOut.volume = 0
            sfxSplashShort.volume = 0
            sfxBubble.volume = 0
            sfxBubble2.volume = 0
        }
    }
}
