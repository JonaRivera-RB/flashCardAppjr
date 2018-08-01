//
//  vistaBoton.swift
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
@IBDesignable

class vistaBoton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        vistaBoton()
    }
    override func prepareForInterfaceBuilder() {
        vistaBoton()
    }
    func vistaBoton(){
        let radius = 8.0
        let path = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: [.bottomRight, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
/*
         
         layer.cornerRadius = 8.0
         layer.shadowColor = UIColor.black.withAlphaComponent(1).cgColor
         layer.shadowOffset = CGSize(width: 0, height: 0)
         layer.shadowOpacity = 0.5*/
    }
}
