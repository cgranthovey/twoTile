//
//  ViewController.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, ADBannerViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bottomBorderBox: UIView!
    @IBOutlet weak var gradientViewTop: UIView!
    
    @IBOutlet var bannerView: ADBannerView!
    
    var words = [ScrabbleWord]()
    var filteredWords = [ScrabbleWord]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        words = StoreWord().getWord()
        
        bannerView.delegate = self
        bannerView.hidden = true
        self.canDisplayBannerAds = true
        bannerView.translatesAutoresizingMaskIntoConstraints = true
//        view.addSubview(bannerView)
        
//        bannerView.translatesAutoresizingMaskIntoConstraints = true
//        bannerView = ADBannerView(adType: .Banner)
//        self.bannerView.frame = CGRectMake(0, self.view.frame.size.height-self.bannerView.frame.size.height, self.bannerView.frame.size.width, self.bannerView.frame.size.height)

        
//        let viewsDictionary = ["bannerView": bannerView]
//        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
//        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView]|", options: [], metrics: nil, views: viewsDictionary))
        
        
        let background1 = CAGradientLayer().whiteToRedColor()
        background1.frame = self.bottomBorderBox.bounds
        self.bottomBorderBox.layer.insertSublayer(background1, atIndex: 0)
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("Error!")
        banner.hidden = true
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        banner.hidden = false
    }


    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inSearchMode{
            return filteredWords.count
        } else {
            return words.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{
            
            let tempWord: ScrabbleWord!
            
            if inSearchMode{
                tempWord = filteredWords[indexPath.row]
            } else{
                tempWord = words[indexPath.row]
            }
            cell.configureCell(tempWord)
            return cell
        } else {
            return PostCell()
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            tableView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredWords = words.filter({$0.word.lowercaseString.rangeOfString(lower) != nil})
            tableView.reloadData()
        }

    }
    
    
//    func dismissKeyboard() {
//        view.endEditing(true)
//    }
//    
//    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
//    view.addGestureRecognizer(tap)
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.text = ""
        inSearchMode = false

        self.searchBar.resignFirstResponder()
        tableView.reloadData()

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let word: ScrabbleWord!
        
        if inSearchMode{
            word = filteredWords[indexPath.row]
        } else {
            word = words[indexPath.row]
        }
        
        performSegueWithIdentifier("WordDetail", sender: word)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WordDetail" {
            if let detailsVC = segue.destinationViewController as? WordDetail{
                if let tempWord = sender as? ScrabbleWord{
                    detailsVC.tappedWord = tempWord
                }
            }
        }
    }
    
//    @IBAction func learnWordBtn(sender: AnyObject){
//        performSegueWithIdentifier("learnWordBtn", sender: nil)
//    }
    
    @IBAction func informationBtn(sender: AnyObject){
        performSegueWithIdentifier("InformationVC", sender: nil)
    }
    
    
    
    
    
    
}




















