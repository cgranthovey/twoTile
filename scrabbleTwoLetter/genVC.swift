//
//  genVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 5/30/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class genVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swipeRightAction")
        swipeRight.direction = .Right
        self.view.addGestureRecognizer(swipeRight)
    }

    
    func swipeRightAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
