//
//  cateColor.swift
//  flashCards
//
//  Created by misael rivera on 24/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//
import UIKit
import Foundation

extension Groups{
    var color:UIColor? {
        get {
            guard let hex = colorHex else { return nil }
            return UIColor(hex: hex)
        }
        set(newColor){
            if let newColor = newColor {
                colorHex = newColor.toHex
            }
        }
    }
}
