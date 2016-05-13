//
//  matchImg.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class matchImg: UIImageView {

    override func awakeFromNib() {
        clipsToBounds = true
        layer.cornerRadius = 7.0
    } 

}
