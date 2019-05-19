//
//  WordInTheAppCell.swift
//  flashCards
//
//  Created by Misael Rivera on 12/15/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class WordInTheAppCell: UITableViewCell {

    @IBOutlet weak var wordLbl2: UILabel!
    @IBOutlet weak var viewMove2: VistaCardforWord!
    
    func configureCell(wordLbl2:String,viewMove2:VistaCardforWord) {
        self.wordLbl2.text = wordLbl2
        self.viewMove2 = viewMove2
    }
    
}
