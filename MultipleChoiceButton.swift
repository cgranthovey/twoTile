//
//  MultipleChoiceButton.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/25/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class MultipleChoiceButton: UIButton {
    
    override func awakeFromNib() {
        self.titleLabel?.numberOfLines = 2
        
        self.titleLabel?.minimumScaleFactor
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.lineBreakMode = NSLineBreakMode.ByClipping

    }

}
