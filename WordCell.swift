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
        background.frame = shadow.bounds
        shadow.layer.insertSublayer(background, atIndex: 0)
        
//        cell.textColor = UIColor.whiteColor()

        
        shadow.layer.cornerRadius = 10.0
        shadow.layer.borderColor = UIColor.blackColor().CGColor
        shadow.layer.borderWidth = 1.0
        shadow.layer.masksToBounds = true
        shadow.backgroundColor = UIColor.clearColor()
        img.alpha = 0.0
    }
    
    var background2 = CAGradientLayer!()
    
    func colorBlue(){

        background2 = CAGradientLayer().hotColors()
        background2.frame = shadow.bounds
        background.insertSublayer(background2, atIndex: 0)
        
        
        cell.textColor = UIColor.greenColor()
        img.backgroundColor = UIColor.greenColor()
    }
    
    func colorWhite(){
        cell.textColor = UIColor.whiteColor()
        background2.hidden = true
    }

    
    func configureCell(word: ScrabbleWord, gameWords: [ScrabbleWord]){
        cell.textColor = UIColor.whiteColor()

        for x in gameWords{
            if x.word == word.word{
                
                cell.textColor = UIColor.greenColor()
                img.alpha = 0.0
                img.backgroundColor = UIColor.yellowColor()
            }
        }
        
        
        
        cell.text = word.word
//        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
//            self.img.image = UIImage(named: "info")
//            self.img.image = image!
//        })
    }

}

