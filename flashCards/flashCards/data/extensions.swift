//
//  extensins.swift
//  flashCards
//
//  Created by misael rivera on 24/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//
import UIKit
import Foundation

extension UIColor{
    //MARK: -Inicializacion
    convenience init?(hex:String) {
        //nos saltamos espacios en blanco y esas cosas
        
        var hexNormalized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        //remplazamos las comillas por nada
        hexNormalized = hexNormalized.replacingOccurrences(of: "#", with: "")
        //variables de rgba
        var rgb:UInt32 = 0
        var r :CGFloat = 0.0
        var g:CGFloat = 0.0
        var b:CGFloat = 0.0
        var a:CGFloat = 0.0
        
        let length = hexNormalized.count
        Scanner(string: hexNormalized).scanHexInt32(&rgb)
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000)>>16)/255.0
            g = CGFloat((rgb & 0x00FF00)>>8)/255.0
            b = CGFloat((rgb & 0x0000FF))/255.0
        } else if length == 8{
            r = CGFloat((rgb & 0xFF000000)>>24)/255.0
            g = CGFloat((rgb & 0x00FF0000)>>16)/255.0
            b = CGFloat((rgb & 0x0000FF00)>>8)/255.0
            a = CGFloat((rgb & 0x000000FF))/255.0
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    var toHex:String? {
        guard let components = cgColor.components, components.count >= 3 else {return nil}
        //variables de RGBA
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        if components.count >= 4 {
            a = Float(components[3])
        }
        //creamos el hex
        let hex = String(format: "%02lX%02lX%02lX%02lX", lroundf(r*255),lroundf(g*255),lroundf(b*255),lroundf(a*255))
        return hex
    }
}
