//
//  DragLabel.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class DragLabel: UILabel {

    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    var sfxCorrectAnswer: AVAudioPlayer!
    var sfxWrongAnswer: AVAudioPlayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        do{
            try sfxCorrectAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct3", ofType: "mp3")!))
            try sfxWrongAnswer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong2", ofType: "mp3")!))
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
        sfxCorrectAnswer.prepareToPlay()
        sfxWrongAnswer.prepareToPlay()
        super.init(coder: aDecoder)
        isVolumeOn()
    }
    
    func isVolumeOn(){
        if DataService.instance.volumeOn == true{
            sfxCorrectAnswer.volume = 0.3
            sfxWrongAnswer.volume = 0.35
        } else {
            sfxCorrectAnswer.volume = 0
            sfxWrongAnswer.volume = 0
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget{
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position){
                self.textColor = UIColor(red: 20.0/255.0, green: 255.0/255.0, blue: 34.0/255.0, alpha: 1.0)
                self.userInteractionEnabled = false
                sfxCorrectAnswer.play()

                NSNotificationCenter.defaultCenter().postNotificationName("correctDrop", object: nil)
            } else{
                self.textColor = UIColor.redColor()
                sfxWrongAnswer.play()
                NSNotificationCenter.defaultCenter().postNotificationName("wrongDrop", object: nil)
            }
            
        }
        self.center = originalPosition
    }
}
