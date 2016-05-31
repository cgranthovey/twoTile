//
//  homeImageBtn.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 5/26/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class homeImageBtn: UIImageView {

    
    override func awakeFromNib() {
        self.superview!.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.superview!.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.superview!.layer.shadowOpacity = 0.7
        self.superview!.layer.shadowRadius = 2
        self.superview!.backgroundColor = UIColor.clearColor()
        self.superview!.clipsToBounds = false
        self.superview!.layer.masksToBounds = false
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    override func drawRect(rect: CGRect) {

    }


}
