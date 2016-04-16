//
//  ScrabbleWord.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation

class ScrabbleWord: NSObject, NSCoding {
    private var _word: String!
    private var _partOfSpeech: String!
    private var _definition: String!
    private var _image: String!
    
    var word: String{
        return _word
    }
    
    var partOfSpeech: String{
        return _partOfSpeech
    }
    
    var definition: String{
        return _definition
    }
    
    var image: String{
        return _image
    }
    
    init(word: String, partOfSpeech: String, definition: String, image: String){
        self._word = word
        self._partOfSpeech = partOfSpeech
        self._definition = definition
        self._image = image
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._word = aDecoder.decodeObjectForKey("word") as? String
        self._partOfSpeech = aDecoder.decodeObjectForKey("partOfSpeech") as? String
        self._definition = aDecoder.decodeObjectForKey("def") as? String
        self._image = aDecoder.decodeObjectForKey("img") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._word, forKey: "word")
        aCoder.encodeObject(self.partOfSpeech, forKey: "partOfSpeech")
        aCoder.encodeObject(self._definition, forKey: "def")
        aCoder.encodeObject(self._image, forKey: "img")
    }
}