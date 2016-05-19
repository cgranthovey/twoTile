//
//  GameBtnImg.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class GameBtnImg: UIImageView {

    override func awakeFromNib() {
        self.alpha = 0.5
        self.clipsToBounds = true
    }

}
