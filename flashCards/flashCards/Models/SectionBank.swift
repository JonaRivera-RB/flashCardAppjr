//
//  BankSection.swift
//  flashCards
//
//  Created by Misael Rivera on 12/12/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

class SectionBank {
    var seccion:String?
    var bankoWords:[WordsBankStruck]?
    
    init(seccion:String, bankoWords:[WordsBankStruck]) {
        self.seccion = seccion
        self.bankoWords = bankoWords
    }
}

