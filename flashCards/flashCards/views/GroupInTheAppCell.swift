//
//  groupInTheAppCell.swift
//  flashCards
//
//  Created by Misael Rivera on 12/9/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class GroupInTheAppCell: UITableViewCell {
    
    @IBOutlet weak var categoria: UILabel!
    @IBOutlet weak var texto: UILabel!
     var sectionIndex:Int?
    
    @IBOutlet weak var vistaColor: UIView!
    @IBOutlet weak var BotonPlay: UIButton!
    
    func configureCell(categoria:String,texto:String,color:UIColor) {
        self.categoria.text = categoria
        self.texto.text = texto
        self.vistaColor.backgroundColor = color
        self.BotonPlay.setTitleColor(color, for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
