//
//  WordDetail.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import AVFoundation

class WordDetail: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var partOfSpeech: UILabel!
    
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var wordDetailContainer: UIView!
    
    @IBOutlet weak var arrowContainer: UIView!
    
    var tappedWord: ScrabbleWord!
    var sfxSwhooshUp: AVAudioPlayer!
    var sfxSwhooshDown: AVAudioPlayer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definition.layer.borderColor = UIColor.blackColor().CGColor
        definition.layer.borderWidth = 1.0
        
        partOfSpeech.layer.borderColor = UIColor.blackColor().CGColor
        partOfSpeech.layer.borderWidth = 1.0
        
        word.text = tappedWord.word
        
        definition.text = tappedWord.definition
        partOfSpeech.text = "   " + tappedWord.partOfSpeech
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
        
        
        arrowContainer.layer.cornerRadius = arrowContainer.frame.width / 2
        arrowContainer.alpha = 0.8
        arrowContainer.backgroundColor = UIColor.lightGrayColor()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "dismissThisView")
        arrowContainer.addGestureRecognizer(tapGesture)
        arrowContainer.userInteractionEnabled = true
        initAudio()
        sfxSwhooshUp.play()
    }

    
    
    func initAudio(){
        do{
            try sfxSwhooshUp = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("upSecond", ofType: "mp3")!))
            try sfxSwhooshDown = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("down", ofType: "wav")!))
            
            
            sfxSwhooshUp.volume = 0.1
            sfxSwhooshDown.volume = 2.0
            
            sfxSwhooshUp.prepareToPlay()
            sfxSwhooshDown.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    
    
    func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.direction == .Down{
            dismissThisView()
        }
    }
    
    func dismissThisView(){
        sfxSwhooshDown.play()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, animations: {
            self.greyView.alpha = 0.4
        })

    }
}