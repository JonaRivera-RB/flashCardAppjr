//
//  groupCell.swift
//  flashCards
//
//  Created by misael rivera on 16/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupColor: UIView!
    @IBOutlet weak var playBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureGroupCell(forGroupName groupName: Groups) {
        self.groupName.text = groupName.group
        self.groupColor.backgroundColor = groupName.color
        self.playBtn.setTitleColor(groupName.color, for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
