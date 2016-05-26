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
    @IBOutlet weak var wikiBtn: UIButton!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var wordDetailContainer: UIView!
    @IBOutlet weak var arrowContainer: UIView!
    
    var tappedWord: ScrabbleWord!
    var sfxSwhooshUp: AVAudioPlayer!
    var sfxSwhooshDown: AVAudioPlayer!
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        word.text = tappedWord.word
        urlString = tappedWord.wiki
        if urlString == ""{
            wikiBtn.hidden = true
        }
        
        definition.text = tappedWord.definition
        partOfSpeech.text = "   " + tappedWord.partOfSpeech
        image.clipsToBounds = true
        
        bringUpPhoto()

        progressBar.startAnimating()
        progressBar.color = UIColor(red: 226.0/255.0, green: 59.0/255.0, blue: 64.0/255.0, alpha: 1.0)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: ("handleSwipe:"))
        downSwipe.direction = .Down
        view.addGestureRecognizer(downSwipe)
        
        
        arrowContainer.layer.cornerRadius = arrowContainer.frame.width / 2
        arrowContainer.alpha = 0.8
        arrowContainer.backgroundColor = UIColor.lightGrayColor()
        
        initAudio()
        sfxSwhooshUp.play()
    }

    @IBAction func openLink (sender: AnyObject){
        if let url = NSURL(string: urlString){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func bringUpPhoto(){
        if Reachability.isConnectedToNetwork() == false{
            self.image.image = UIImage(named: "diff3")
        } else{
            ImageLoader.sharedLoader.imageForUrl(tappedWord.image, completionHandler:{(image: UIImage?, url: String) in
                if image != nil{
                    self.image.image = image!
                } else {
                    self.image.image = UIImage(named: "diff3")
                }
                
                self.progressBar.hidden = true
            })
        }
    }
    
    func initAudio(){
        do{
            try sfxSwhooshUp = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("upSecond", ofType: "mp3")!))
            try sfxSwhooshDown = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("down", ofType: "wav")!))
            sfxSwhooshUp.prepareToPlay()
            sfxSwhooshDown.prepareToPlay()
            volume()

        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func volume(){
        if DataService.instance.volumeOn == true{
            sfxSwhooshUp.volume = 0.05
            sfxSwhooshDown.volume = 1.0
        } else{
            sfxSwhooshUp.volume = 0
            sfxSwhooshDown.volume = 0
        }
    }
    
    func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.direction == .Down{
            dismissThisView()
        }
    }
    
    @IBAction func dismissViewControllerBtn(sender: UIButton){
        dismissThisView()
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