//
//  DataService.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/15/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation
import UIKit

class DataService{
    
    static let instance = DataService()
    
    private var _savedWords = [ScrabbleWord]()
    private var _deletedWords: [ScrabbleWord]!
    
    let KEY_SAVED = "saved"
    let KEY_DELETED = "deleted"
    
    var savedWords: [ScrabbleWord]{
            return _savedWords
    }
    
    var deletedWords: [ScrabbleWord]{
        if _deletedWords != nil{
            return _deletedWords
        } else {
            return [ScrabbleWord]()
        }
    }
    
    func savePosts(){
        let postsDataS = NSKeyedArchiver.archivedDataWithRootObject(_savedWords)
        let postsDataD = NSKeyedArchiver.archivedDataWithRootObject(_deletedWords)
        
        NSUserDefaults.standardUserDefaults().setObject(postsDataS, forKey: KEY_SAVED)
        NSUserDefaults.standardUserDefaults().setObject(postsDataD, forKey: KEY_DELETED)
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts(){
        if let postsDataS = NSUserDefaults.standardUserDefaults().objectForKey(KEY_SAVED) as? NSData{
            if let savedArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsDataS) as? [ScrabbleWord]{
                _savedWords = savedArray
            }
        }
        if let postsDataD = NSUserDefaults.standardUserDefaults().objectForKey(KEY_DELETED) as? NSData{
            if let deletedArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsDataD) as? [ScrabbleWord]{
                _deletedWords = deletedArray
            }
        }
    }
    
    func addWords(savedWord: [ScrabbleWord], deletedWord: [ScrabbleWord]){
        _savedWords = savedWord
        _deletedWords = deletedWord
        savePosts()
        loadPosts()
    }
    
    
}