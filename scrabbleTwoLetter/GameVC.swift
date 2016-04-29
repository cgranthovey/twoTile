//
//  GameVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/16/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    


}
