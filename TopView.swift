//
//  TopView.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/27/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class TopView: UIView {

    override func awakeFromNib() {
        let background = CAGradientLayer().redColor()
        background.frame = self.bounds
        self.layer.insertSublayer(background, atIndex: 0)
    }
    
}