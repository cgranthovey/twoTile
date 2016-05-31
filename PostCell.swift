//
//  PostCell.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var tapIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(scrabWord: ScrabbleWord) {
        self.word.text = scrabWord.word
        self.definition.text = scrabWord.definition
        
        if scrabWord.word == "Aa"{
            tapIcon.hidden = false
        } else {
            tapIcon.hidden = true
        }
        
    }
}