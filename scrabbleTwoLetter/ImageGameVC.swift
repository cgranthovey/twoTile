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

    
    var savedWords = [ScrabbleWord]()
    var x: Int!
    var y: Int!
    var chooseArray = [Int]()
    var randChooseArray = [Int]()
    var numberOfCorrectDrops: Int!
    var numberOfWords: Int!
    
    @IBOutlet weak var firstWord: DragLabel!
    @IBOutlet weak var secondWord: DragLabel!
    @IBOutlet weak var thirdWord: DragLabel!
    @IBOutlet weak var fourthWord: DragLabel!
    
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var fourthImg: UIImageView!
    
    @IBOutlet weak var wordStack: UIStackView!
    @IBOutlet weak var imageStack: UIStackView!
    
    @IBOutlet weak var gameEnd: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reset", name: "correctDrop", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        savedWords = DataService.instance.savedWords
        savedWords.shuffleInPlace()
        numberOfWords = savedWords.count
        x = 0
        y = 0
        chooseArray = [x, x+1, x+2, x+3]
        chooseWords()
        numberOfCorrectDrops = 0
    }
    
    
    func reset() {
        if numberOfCorrectDrops == 3 || numberOfCorrectDrops == 2 && fourthImg.hidden == true || numberOfCorrectDrops == 1 && fourthImg.hidden == true && thirdImg.hidden == true || numberOfCorrectDrops == 0 && fourthImg.hidden == true && thirdImg.hidden == true && secondImg.hidden == true{
            
            if y >= savedWords.count{
                
                y = 0
                x = 0
                gameEnd.hidden = false
                imageStack.hidden = true
                wordStack.hidden = true
                savedWords.shuffleInPlace()
                chooseWords()
                
            }
            

            
            CATransaction.begin()

            CATransaction.setCompletionBlock({
                self.numberOfCorrectDrops = 0
                self.x = self.x + 4
                self.chooseArray = [self.x, self.x+1, self.x+2, self.x+3]
                self.chooseWords()
                

                
                self.firstWord.userInteractionEnabled = true
                self.secondWord.userInteractionEnabled = true
                self.thirdWord.userInteractionEnabled = true
                self.fourthWord.userInteractionEnabled = true
                self.firstWord.textColor = UIColor.blackColor()
                self.secondWord.textColor = UIColor.blackColor()
                self.thirdWord.textColor = UIColor.blackColor()
                self.fourthWord.textColor = UIColor.blackColor()
                
                return
            })
            
            
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                self.wordStack.alpha = 0
                self.imageStack.alpha = 0
                }){ (finished: Bool) -> Void in
                    
                    
                    UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
                        self.wordStack.alpha = 1
                        self.imageStack.alpha = 1
                        }, completion: nil)
            }
            
            CATransaction.commit()
            


        }
        numberOfCorrectDrops = numberOfCorrectDrops + 1
    }
    
    func chooseWords(){
        
        
        
        
        if chooseArray[0] == savedWords.count{
            print("great job")
        } else if chooseArray[1] == savedWords.count{
            print(chooseArray[1])
            print(savedWords.count)
            print("1 is called")
            firstWord.text = savedWords[chooseArray[0]].word
            
            print(savedWords[chooseArray[0]].word)
            
            secondWord.text = ""
            thirdWord.text = ""
            fourthWord.text = ""
            
            let url = savedWords[chooseArray[0]].image
            print(url)
            ImageLoader.sharedLoader.imageForUrl(url, completionHandler: { (image, url) -> () in
                print("in images")
                self.firstImg.image = image!
                print("next")
                self.secondImg.hidden = true
                self.thirdImg.hidden = true
                self.fourthImg.hidden = true
            })
            
            firstWord.dropTarget = firstImg
            
            
        } else if chooseArray[2] == savedWords.count{
            print("2 is called")

            firstWord.text = savedWords[chooseArray[0]].word
            secondWord.text = savedWords[chooseArray[1]].word
            thirdWord.text = ""
            fourthWord.text = ""
            
            randChooseArray = chooseArray
            randChooseArray.removeAtIndex(3)
            randChooseArray.removeAtIndex(2)
            randChooseArray.shuffleInPlace()
            
            for var y in 0...1{
                var tempImageURL = savedWords[randChooseArray[y]].image
                ImageLoader.sharedLoader.imageForUrl(tempImageURL, completionHandler: { (image, url) -> () in
                    switch y{
                        case 0: self.firstImg.image = image!
                        default: self.secondImg.image = image!
                        self.thirdImg.hidden = true
                        self.fourthImg.hidden = true
                    }
                })
            }
            
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[0]].word{
                firstWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[1]].word{
                firstWord.dropTarget = secondImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[0]].word{
                secondWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[1]].word{
                secondWord.dropTarget = secondImg
            }
            
        } else if chooseArray[3] == savedWords.count{
            print("3 is called")
            firstWord.text = savedWords[chooseArray[0]].word
            secondWord.text = savedWords[chooseArray[1]].word
            thirdWord.text = savedWords[chooseArray[2]].word
            fourthWord.text = ""
            
            randChooseArray = chooseArray
            randChooseArray.removeAtIndex(3)
            randChooseArray.shuffleInPlace()
            
            for var y in 0...2{
                var tempImageUrl = savedWords[randChooseArray[y]].image
                ImageLoader.sharedLoader.imageForUrl(tempImageUrl, completionHandler: { (image, url) -> () in
                    switch y{
                        case 0: self.firstImg.image = image!
                        case 1: self.secondImg.image = image!
                        default: self.thirdImg.image = image!
                        self.fourthImg.hidden = true
                    }
                })
            }
                if savedWords[chooseArray[0]].word == savedWords[randChooseArray[0]].word{
                    firstWord.dropTarget = firstImg
                }
                if savedWords[chooseArray[0]].word == savedWords[randChooseArray[1]].word{
                    firstWord.dropTarget = secondImg
                }
                if savedWords[chooseArray[0]].word == savedWords[randChooseArray[2]].word{
                    firstWord.dropTarget = thirdImg
                }
                if savedWords[chooseArray[1]].word == savedWords[randChooseArray[0]].word{
                    secondWord.dropTarget = firstImg
                }
                if savedWords[chooseArray[1]].word == savedWords[randChooseArray[1]].word{
                    secondWord.dropTarget = secondImg
                }
                if savedWords[chooseArray[1]].word == savedWords[randChooseArray[2]].word{
                    secondWord.dropTarget = thirdImg
                }
                if savedWords[chooseArray[2]].word == savedWords[randChooseArray[0]].word{
                    thirdWord.dropTarget = firstImg
                }
                if savedWords[chooseArray[2]].word == savedWords[randChooseArray[1]].word{
                    thirdWord.dropTarget = secondImg
                }
                if savedWords[chooseArray[2]].word == savedWords[randChooseArray[2]].word{
                    thirdWord.dropTarget = thirdImg
                    }
        } else {
            firstWord.text = savedWords[chooseArray[0]].word
            secondWord.text = savedWords[chooseArray[1]].word
            thirdWord.text = savedWords[chooseArray[2]].word
            fourthWord.text = savedWords[chooseArray[3]].word
            randChooseArray = chooseArray
            randChooseArray.shuffleInPlace()
            
            for var y in 0...3{
                var tempImageURL = savedWords[randChooseArray[y]].image
                
                ImageLoader.sharedLoader.imageForUrl(tempImageURL, completionHandler:{(image: UIImage?, url: String) in
                    switch y{
                    case 0: self.firstImg.image = image!
                    case 1: self.secondImg.image = image!
                    case 2: self.thirdImg.image = image!
                    default: self.fourthImg.image = image!
                    }
                })
            }
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[0]].word{
                firstWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[1]].word{
                firstWord.dropTarget = secondImg
            }
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[2]].word{
                firstWord.dropTarget = thirdImg
            }
            if savedWords[chooseArray[0]].word == savedWords[randChooseArray[3]].word{
                firstWord.dropTarget = fourthImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[0]].word{
                secondWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[1]].word{
                secondWord.dropTarget = secondImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[2]].word{
                secondWord.dropTarget = thirdImg
            }
            if savedWords[chooseArray[1]].word == savedWords[randChooseArray[3]].word{
                secondWord.dropTarget = fourthImg
            }
            if savedWords[chooseArray[2]].word == savedWords[randChooseArray[0]].word{
                thirdWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[2]].word == savedWords[randChooseArray[1]].word{
                thirdWord.dropTarget = secondImg
            }
            if savedWords[chooseArray[2]].word == savedWords[randChooseArray[2]].word{
                thirdWord.dropTarget = thirdImg
            }
            if savedWords[chooseArray[2]].word == savedWords[randChooseArray[3]].word{
                thirdWord.dropTarget = fourthImg
            }
            if savedWords[chooseArray[3]].word == savedWords[randChooseArray[0]].word{
                fourthWord.dropTarget = firstImg
            }
            if savedWords[chooseArray[3]].word == savedWords[randChooseArray[1]].word{
                fourthWord.dropTarget = secondImg
            }
            if savedWords[chooseArray[3]].word == savedWords[randChooseArray[2]].word{
                fourthWord.dropTarget = thirdImg
            }
            if savedWords[chooseArray[3]].word == savedWords[randChooseArray[3]].word{
                fourthWord.dropTarget = fourthImg
            }
        }


        y = y+4
    }
    
    func random(x: Int) -> Int {
        let randNumber = Int(arc4random_uniform(UInt32(x)))
        return randNumber
    }

    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func playAgain(sender: AnyObject){
        x = 0
        wordStack.hidden = false
        imageStack.hidden = false
        firstImg.hidden = false
        secondImg.hidden = false
        thirdImg.hidden = false
        fourthImg.hidden = false
        
        gameEnd.hidden = true

    }

    @IBAction func gameScreen(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func removeSomeWords(sender: AnyObject){
        var jumpVC = navigationController?.viewControllers[1] as? UITabBarController
        self.navigationController?.popToViewController((jumpVC)!, animated: true)
        jumpVC?.selectedIndex = 0
    }
    



}
