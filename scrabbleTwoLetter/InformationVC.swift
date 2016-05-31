//
//  InformationVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/26/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class InformationVC: genVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func icons8 (sender: AnyObject){
        openLink("https://icons8.com/")
    }
    
    @IBAction func openClipArt(sender: AnyObject){
        openLink("https://openclipart.org/")
    }
    
    @IBAction func smokingDrum(sender: AnyObject){
        openLink("http://www.smokingdrum.com/")
    }
    
    @IBAction func freeSFX(sender: AnyObject){
        openLink("http://www.freesfx.co.uk/")
    }
    
    @IBAction func freeSound(sender: AnyObject){
        openLink("http://www.freesound.org/people/DrMinky/sounds/174435/")        //http://www.freesound.org/people/DrMinky/sounds/174435/
    }
    
    @IBAction func freepic(sender: AnyObject){
        openLink("http://www.freepik.com/free-photos-vectors/background")  //Background vector designed by Kjpargeter - Freepik.com
    }
    
    @IBAction func tairaKomori(sender: AnyObject){
        openLink("http://taira-komori.jpn.org/freesounden.html")
    }
    
    @IBAction func theNounProject(sender: AnyObject){
        openLink("https://thenounproject.com/")
    }
    
    func openLink(urlString: String){
        if let url = NSURL(string: urlString){
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}