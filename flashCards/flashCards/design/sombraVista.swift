//
//  sombraVista.swift
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable

class sombraVista: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        vistaSombra()
    }
    override func prepareForInterfaceBuilder() {
        vistaSombra()
    }
    func vistaSombra(){
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.5
    }
}
