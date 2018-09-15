//
//  groupCell.swift
//  flashCards
//
//  Created by misael rivera on 16/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class groupCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupColor: UIView!
    
    func configureGroupCell(forGroupName groupName: Groups) {
        self.groupName.text = groupName.group
        self.groupColor.backgroundColor = groupName.color
    }
}
