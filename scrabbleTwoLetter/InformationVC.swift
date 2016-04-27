//
//  InformationVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/26/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class InformationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func icons8 (sender: AnyObject){
        let urlString = "https://icons8.com/"
        if let url = NSURL(string: urlString){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func openClipArt(sender: AnyObject){
        let urlString = "https://openclipart.org/"
        if let url = NSURL(string: urlString){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func smokingDrum(sender: AnyObject){
        let urlString = "http://www.smokingdrum.com/"
        if let url = NSURL(string: urlString){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

}
