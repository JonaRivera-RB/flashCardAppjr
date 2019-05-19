//
//  vistaBotones.swift
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable

class vistaBotones: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        vistaBotones()
    }
    override func prepareForInterfaceBuilder() {
        vistaBotones()
    }
    func vistaBotones(){
        layer.cornerRadius = 22.0
       // layer.shadowRadius = 2.0
        //layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.2
        
    }
}
