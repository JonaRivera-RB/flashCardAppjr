//
//  Questions.swift
//  flashCards
//
//  Created by Misael Rivera on 12/12/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

class WordsInPhone {
    var word:String?
    var translate:String?
    
    init(word:String, translate:String) {
        self.word = word
        self.translate = translate
    }
}

struct WordsBankStruck {
    var section:String!
    var wordsArrayPhone:[WordsInPhone]!
}

