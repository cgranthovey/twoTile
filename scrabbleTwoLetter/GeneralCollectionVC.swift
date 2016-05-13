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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAudio()
    }
    

    
    func initAudio(){
        do{
            try sfxFadeOut = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("fadeWord", ofType: "wav")!))
            sfxFadeOut.prepareToPlay()
            sfxFadeOut.volume = 5
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    


}
