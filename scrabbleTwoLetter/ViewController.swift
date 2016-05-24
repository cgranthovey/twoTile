//
//  ViewController.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bottomBorderBox: UIView!
    @IBOutlet weak var gradientViewTop: UIView!
    
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
        
        let background1 = CAGradientLayer().whiteToRedColor()
        background1.frame = self.bottomBorderBox.bounds
        self.bottomBorderBox.layer.insertSublayer(background1, atIndex: 0)
        
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
    
    @IBAction func homeButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func gamesButton(sender: AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
}




















