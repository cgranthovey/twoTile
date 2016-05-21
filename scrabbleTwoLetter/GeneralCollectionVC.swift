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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAudio()
    }
    

    
    func initAudio(){
        do{
            try sfxFadeOut = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fadeWord", ofType: "wav")!))

            try sfxSplashShort = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("rockSplashShort", ofType: "mp3")!))
            try sfxBubble = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bubble", ofType: "mp3")!))
            try sfxBubble2 = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bubbleVariant", ofType: "mp3")!))

            sfxFadeOut.prepareToPlay()
            sfxFadeOut.volume = 3
            sfxSplashShort.prepareToPlay()
            sfxSplashShort.volume = 0.2
            sfxBubble.volume = 0.1
            sfxBubble.prepareToPlay()
            sfxBubble2.volume = 0.1
            sfxBubble2.prepareToPlay()

        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    


}
