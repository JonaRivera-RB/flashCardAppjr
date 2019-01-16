//
//  wordCell.swift
//  flashCards
//
//  Created by misael rivera on 29/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var wordDescriptionLbl: UILabel!
    @IBOutlet weak var wordTranslateLbl: UILabel!
    @IBOutlet weak var viewLearned: UIView!
    
    func configureCell(word:Words) {
        self.wordDescriptionLbl.text = word.word
        self.wordTranslateLbl.text = word.translate
        
        if word.goal == word.goalCompletion {
            self.viewLearned.isHidden = false
        } else {
            self.viewLearned.isHidden = true
        }
    }
    
    
    
    
}
