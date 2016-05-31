//
//  WelcomeVC.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 5/26/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var dictionaryBtn: UIButton!
    @IBOutlet weak var gamesBtn: UIButton!
    @IBOutlet weak var volumeBtn: UIButton!
    @IBOutlet weak var gradientBlueGreenView: UIView!
    
    @IBOutlet weak var topGradientView: UIView!
    
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonInfo(dictionaryBtn)
        buttonInfo(gamesBtn)
        dictionaryBtn.backgroundColor = UIColor(red: 108.0/255.0, green: 147.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        gamesBtn.backgroundColor = UIColor(red: 102.0/255.0, green: 255.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        gradientBlueGreenView.clipsToBounds = true
        
        let slimGradientView = CAGradientLayer().greenToBlue()
        slimGradientView.frame = gradientBlueGreenView.bounds
        gradientBlueGreenView.layer.addSublayer(slimGradientView)
        
        let topGrad = CAGradientLayer().redColor()
        topGrad.frame = mainView.bounds
        topGradientView.layer.addSublayer(topGrad)

        volumeOnLoad(volumeBtn)
    }
    
    override func viewWillAppear(animated: Bool) {

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

    
    @IBAction func volumeBtnPress(sender: UIButton){
        if DataService.instance.volumeOn == true{
            DataService.instance.updateVolumeOn(false)
            if let image = UIImage(named: "darkGreyMute"){
                sender.setImage(image, forState: .Normal)
            }
        } else{
            DataService.instance.updateVolumeOn(true)
            if let image = UIImage(named: "darkGreyVolume"){
                sender.setImage(image, forState: .Normal)
            }
        }
    }
    
    func volumeOnLoad(button: UIButton){
        if DataService.instance.volumeOn == true{
            if let image = UIImage(named: "darkGreyVolume"){
                button.setImage(image, forState: .Normal)
            }
        } else {
            if let image = UIImage(named: "darkGreyMute"){
                button.setImage(image, forState: .Normal)
            }
        }
    }


}
