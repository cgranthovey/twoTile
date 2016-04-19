//
//  DragLabel.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation
import UIKit

class DragLabel: UILabel {

    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
                NSNotificationCenter.defaultCenter().postNotificationName("correctDrop", object: nil)
            }
        }
        self.center = originalPosition
    }
    
}
