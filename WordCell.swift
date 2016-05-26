//
//  WordCell.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/12/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import Foundation


class WordCell: UICollectionViewCell {
    @IBOutlet weak var cell: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var shadow: UIView!
    
    var background = CAGradientLayer!()
    
    override func awakeFromNib() {

        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.backgroundColor = UIColor.clearColor()
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 1.0
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        
        img.backgroundColor = UIColor.whiteColor()
        
        background = CAGradientLayer().collectionButtonBlue()
        
        var tempSize = CGSizeMake(150, 150)
        let sizeOfScreen = UIScreen.mainScreen().bounds.height
        if sizeOfScreen <= 568{
            tempSize =  CGSizeMake(92, 92)
        } else if sizeOfScreen <= 667{
            tempSize = CGSizeMake(105, 105)
        } else if sizeOfScreen <= 736{
            tempSize =  CGSizeMake(115, 115)
        } else{
            tempSize = CGSizeMake(140, 140)
        }
        
        background.frame = CGRect(origin: CGPointZero, size: tempSize)
        shadow.layer.insertSublayer(background, atIndex: 0)
        
        background2 = CAGradientLayer().hotColors()
        background2.frame = background.bounds
        background.insertSublayer(background2, atIndex: 0)
        background2.opacity = 0.0
        
        cell.textColor = UIColor.whiteColor()

        shadow.layer.cornerRadius = 10.0
        shadow.layer.borderColor = UIColor.blackColor().CGColor
        shadow.layer.borderWidth = 1.0
        shadow.layer.masksToBounds = true
        shadow.backgroundColor = UIColor.clearColor()
        img.alpha = 0.0
    }
    
    var background2 = CAGradientLayer!()
    
    func colorForGame(){
        background2.opacity = 1.0
    }
    
    func colorForGameRemove(){
        background2.opacity = 0
       // background2.hidden = true
    }

    
    func configureCell(word: ScrabbleWord, gameWords: [ScrabbleWord]){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        background2.opacity = 0.0
        for x in gameWords{
            if x.word == word.word{
                background2.opacity = 1.0
            }
        }
        
        CATransaction.commit()
        cell.text = word.word
    }

}