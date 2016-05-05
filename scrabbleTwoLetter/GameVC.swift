//
//  GameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/16/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class GameVC: UIViewController, UITabBarDelegate {

    var allWords = [ScrabbleWord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allWords = StoreWord().getWord()
        DataService.instance.loadPosts()
        if DataService.instance.deletedWords.count == 0{        //if there aren't any deleted words then we add all words to the data servcie add words
            
            DataService.instance.addWords(allWords, deletedWord: [ScrabbleWord]())
        }
        
}
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    


}
