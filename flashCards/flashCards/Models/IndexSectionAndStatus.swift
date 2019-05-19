//
//  IndexSectionAndStatus.swift
//  flashCards
//
//  Created by Misael Rivera on 12/18/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import Foundation
class IndexSectionAndSatus {
    var section:Int?
    var index:Int?
    var turnOn:Bool?
    
    init(section:Int,index:Int,turnOn:Bool) {
        self.section = section
        self.index = index
        self.turnOn = turnOn
    }
}
