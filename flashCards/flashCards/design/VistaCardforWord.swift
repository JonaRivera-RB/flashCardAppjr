//
//  VistaCardforWord.swift
//  flashCards
//
//  Created by Misael Rivera on 12/16/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable
class VistaCardforWord: UIControl {
        override func awakeFromNib() {
            super.awakeFromNib()
            vistaSombra()
        }
        override func prepareForInterfaceBuilder() {
            vistaSombra()
        }
        func vistaSombra(){
            layer.cornerRadius = 15
            layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
            layer.shadowOffset = CGSize(width: 0, height: 0)
            layer.shadowOpacity = 0.5
        }
}
