//
//  LearnWordBtn.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/26/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class LearnWordBtn: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 4.0
        self.clipsToBounds = true
        self.backgroundColor = UIColor(red: 89.0/255.0, green: 133.0/255.0, blue: 203.0/255.0, alpha: 1.0)
    }

}
