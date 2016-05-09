//
//  roundedCornersView.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/13/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class roundedCornersView: UIView {

    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}

class ImgShadow: UIView{
    
}