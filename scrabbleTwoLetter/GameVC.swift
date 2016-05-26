//
//  GameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/16/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class GameVC: UIViewController{

    var allWords = [ScrabbleWord]()
    
    @IBOutlet weak var gameWords: UIButton!
    @IBOutlet weak var wordList: UIButton!
    @IBOutlet weak var volumeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allWords = StoreWord().getWord()
        DataService.instance.loadPosts()
        if DataService.instance.deletedWords.count == 0{        //if there aren't any deleted words then we add all words to the data servcie add words
            
            DataService.instance.addWords(allWords, deletedWord: [ScrabbleWord]())
        }
        
        buttonInfo(gameWords)
        buttonInfo(wordList)

        gameWords.backgroundColor = UIColor(red: 102.0/255.0, green: 255.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        wordList.backgroundColor = UIColor(red: 108.0/255.0, green: 147.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        
        volumeOnLoad(volumeBtn)
}
    
    @IBAction func volumeBtnPress(sender: UIButton){
        if DataService.instance.volumeOn == true{
            DataService.instance.updateVolumeOn(false)
            if let image = UIImage(named: "mute"){
                sender.setImage(image, forState: .Normal)
            }
        } else{
            DataService.instance.updateVolumeOn(true)
            if let image = UIImage(named: "highVolume"){
                sender.setImage(image, forState: .Normal)
            }
        }
    }
    
    func volumeOnLoad(button: UIButton){
        if DataService.instance.volumeOn == true{
            if let image = UIImage(named: "highVolume"){
                button.setImage(image, forState: .Normal)
            }
        } else {
            if let image = UIImage(named: "mute"){
                button.setImage(image, forState: .Normal)
            }
        }
    }
    
    func buttonInfo(sender: UIButton){

        sender.superview!.layer.shadowColor = UIColor.darkGrayColor().CGColor
        sender.superview!.layer.shadowOffset = CGSize(width: 0, height: 0)
        sender.superview!.layer.shadowOpacity = 0.7
        sender.superview!.layer.shadowRadius = 2
        sender.superview!.backgroundColor = UIColor.clearColor()
        sender.superview!.clipsToBounds = false
        sender.superview!.layer.masksToBounds = false
        
        sender.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        sender.layer.cornerRadius = 5
        sender.clipsToBounds = true
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}