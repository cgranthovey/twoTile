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
//        self.layer.shadowColor = UIColor.blackColor().CGColor
//        self.layer.shadowOffset = CGSizeMake(0, 0)
//        self.layer.shadowOpacity = 0.8
//        self.layer.shadowRadius = 1.0
//
//        self.layer.masksToBounds = false
//        
//        img.clipsToBounds = true
//        img.layer.cornerRadius = 5.0
//        img.alpha = 0.5
//        img.layer.masksToBounds = true
//
        
        
        
        
        
        
//        self.layer.cornerRadius = 10
//        
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.blackColor().CGColor
        
        self.layer.shadowColor = UIColor.darkGrayColor().CGColor
        self.backgroundColor = UIColor.clearColor()
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 1.0
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        
        shadow.layer.cornerRadius = 10.0
        shadow.layer.borderColor = UIColor.blackColor().CGColor
        shadow.layer.borderWidth = 1.0
        shadow.layer.masksToBounds = true
        shadow.backgroundColor = UIColor.clearColor()
        
        
        
        
        
        
        
        
        
        
//        // corner radius
//        blueView.layer.cornerRadius = 10
//        
//        // border
//        blueView.layer.borderWidth = 1.0
//        blueView.layer.borderColor = UIColor.blackColor().CGColor
//        
//        // shadow
//        blueView.layer.shadowColor = UIColor.blackColor().CGColor
//        blueView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        blueView.layer.shadowOpacity = 0.7
//        blueView.layer.shadowRadius = 4.0
        

    }

    
    func hideBtn(button: UIButton){
        print("I'm called!")
        print(button.tag)
        print(button.hidden)
        button.hidden = false
        print(button.hidden)

    }

    
    func configureCell(word: ScrabbleWord){
        cell.text = word.word

        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
            self.img.image = image!
        })
    }

}

