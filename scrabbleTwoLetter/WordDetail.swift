//
//  WordDetail.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class WordDetail: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var partOfSpeech: UILabel!
    
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    var tappedWord: ScrabbleWord!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word.text = tappedWord.word
        definition.text = tappedWord.definition
        partOfSpeech.text = tappedWord.partOfSpeech
        
        
        ImageLoader.sharedLoader.imageForUrl(tappedWord.image, completionHandler:{(image: UIImage?, url: String) in
            self.image.image = image!
            self.progressBar.hidden = true
        })
        progressBar.startAnimating()
        progressBar.color = UIColor(red: 226.0/255.0, green: 59.0/255.0, blue: 64.0/255.0, alpha: 1.0)
        
    }
    
    @IBAction func backBtn(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
