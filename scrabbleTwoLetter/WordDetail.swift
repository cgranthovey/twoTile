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
    
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    
    
    var tappedWord: ScrabbleWord!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word.text = tappedWord.word
        definition.text = tappedWord.definition
        partOfSpeech.text = tappedWord.partOfSpeech
        
        image.clipsToBounds = true
        
        ImageLoader.sharedLoader.imageForUrl(tappedWord.image, completionHandler:{(image: UIImage?, url: String) in
            self.image.image = image!
            self.progressBar.hidden = true
        })
        progressBar.startAnimating()
        progressBar.color = UIColor(red: 226.0/255.0, green: 59.0/255.0, blue: 64.0/255.0, alpha: 1.0)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: ("handleSwipe:"))
        downSwipe.direction = .Down
        view.addGestureRecognizer(downSwipe)
        
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.direction == .Down{
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, animations: {
            self.greyView.alpha = 0.4
        })
    }
}