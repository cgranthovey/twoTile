//
//  WordCell.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/12/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    @IBOutlet weak var cell: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0

    }
    
    func addImageToCell(word: ScrabbleWord){
        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
            self.img.image = image!
        })
    }

    
    
    func configureCell(word: ScrabbleWord){
        cell.text = word.word
//        ImageLoader.sharedLoader.imageForUrl(word.image, completionHandler:{(image: UIImage?, url: String) in
//            self.img.image = image!
//        })
        
    }

}

