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
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0, 0)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 1.0
        
        self.layer.masksToBounds = false
        
        img.clipsToBounds = true
        img.layer.cornerRadius = 5.0
        
        img.alpha = 0.5
    }

    

    
    
    
    
    
    
    
    
    
    
    
    


    
    func addImageToCell(word: ScrabbleWord){

    }

    
    
    func configureCell(word: ScrabbleWord){
        cell.text = word.word

        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
            self.img.image = image!
        })
            
    }

}

