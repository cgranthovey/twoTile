//
//  ImageGameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/18/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

class ImageGameVC: UIViewController {
    
    var allWords = StoreWord().getWord()
    var allWordsMinusOne: [ScrabbleWord]!
    var gameWords: [ScrabbleWord]!
    var x: Int!
    var numberOfPlays: Int!
    
    @IBOutlet weak var firstWord: DragLabel!

    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var fourthImg: UIImageView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var imageStackView: UIStackView!
    
    @IBOutlet weak var gameEnd: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameWords = DataService.instance.savedWords
        
        allWords.shuffleInPlace()
        gameWords.shuffleInPlace()
        x = 0
        numberOfPlays = 0
        reset()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reset", name: "correctDrop", object: nil)
    }
    
    func reset(){
        
        if numberOfPlays == gameWords.count{
            
            imageStackView.hidden = true
            firstWord.hidden = true
            gameEnd.hidden = false
            numberOfPlays = 0
            
            gameWords.shuffleInPlace()
            x = 0
            
        }
        numberOfPlays = numberOfPlays + 1
        
        firstWord.textColor = UIColor.blackColor()
        firstWord.userInteractionEnabled = true
        
        allWordsMinusOne = allWords
        allWordsMinusOne.shuffleInPlace()
        let currentWord = gameWords[x]
        x = x + 1
        
        firstWord.text = currentWord.word
        var imageArray = [firstImg, secondImg, thirdImg, fourthImg]
        imageArray.shuffleInPlace()
        var y = 0
        for var x in allWordsMinusOne{
            if x.word == currentWord.word{
                allWordsMinusOne.removeAtIndex(y)
                
            }
            y = y + 1
        }
        postImgs(currentWord.image, imgView: imageArray[0])
        postImgs(allWordsMinusOne[0].image, imgView: imageArray[1])
        postImgs(allWordsMinusOne[1].image, imgView: imageArray[2])
        postImgs(allWordsMinusOne[2].image, imgView: imageArray[3])
        
        if firstImg == imageArray[0]{
            firstWord.dropTarget = firstView
        } else if secondImg == imageArray[0]{
            firstWord.dropTarget = secondView
        } else if thirdImg == imageArray[0]{
            firstWord.dropTarget = thirdView
        } else {
            firstWord.dropTarget = fourthView
        }
        
        
    }
    
    
    
    
    
    
    func postImgs(image: String, imgView: UIImageView){
        ImageLoader.sharedLoader.imageForUrl(image, completionHandler: {(image: UIImage?, url: String)
            in
            imgView.image = image!
    })
    }

    
    @IBAction func homeButton(sender: AnyObject!){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func playAgain(sender: AnyObject!){
        imageStackView.hidden = false
        firstWord.hidden = false
        
        gameEnd.hidden = true
    }
    
    @IBAction func gameScreen(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func deleteWords(sender: AnyObject!){
        var jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController((jumpVC)!, animated: true)
        jumpVC?.selectedIndex = 0
    }
    
    @IBAction func backButton(sender: AnyObject!){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    
}
