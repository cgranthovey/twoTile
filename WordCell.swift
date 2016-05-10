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
    
    override func awakeFromNib() {

        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.backgroundColor = UIColor.clearColor()
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 1.0
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        
        let background = CAGradientLayer().collectionButtonBlue()
        background.frame = shadow.bounds
        shadow.layer.insertSublayer(background, atIndex: 0)
        
        cell.textColor = UIColor.whiteColor()
        
        shadow.layer.cornerRadius = 10.0
        shadow.layer.borderColor = UIColor.blackColor().CGColor
        shadow.layer.borderWidth = 1.0
        shadow.layer.masksToBounds = true
        shadow.backgroundColor = UIColor.clearColor()
        
        img.alpha = 0.6
    }
    
    
    func configureCell(word: ScrabbleWord){
        cell.text = word.word
//        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
//            self.img.image = UIImage(named: "info")
//            self.img.image = image!
//        })
    }

}

