//
//  AboutViewController.swift
//  flashCards
//
//  Created by Misael Rivera on 11/4/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import StoreKit
import MessageUI
import SCLAlertView

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func rateUsBtnWasPressed(_ sender: Any) {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            //request review manual method here
        }
    }
    @IBAction func submitBtnWasPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self
        mailComposeViewController.setToRecipients(["jonathanriveramb@gmail.com"])
        mailComposeViewController.setSubject("Subject")
            mailComposeViewController.setMessageBody("Hello man you have a bug!:", isHTML: false)
        
        present(mailComposeViewController, animated: true, completion: nil)
        }
        else {
            SCLAlertView().showNotice("Ups", subTitle: "You have to add an account of email your Mail app")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func howToPlayBtnWasPressed(_ sender: Any) {
        //SCLAlertView().showInfo("Important info", subTitle: "First.- Add new category on your library. \n Second.- Add three or more words and the times you want to practice this word. \n Third.- Practice your words on the playground.\n Fourth.- Check your statistics. \n If you have a problem contact us")
        SCLAlertView().showInfo("Información importante", subTitle: "Primero.- Tienes que agregar una categoria a tu libreria. \n\n Segundo.- Agrega 3 o mas palabras para que puedas practicarlas. \n\n Tercero.- Practicas tus palabras!.\n\n Cuarto.- Revisa tus estadisticas!, sube de nivel y aprnede mucho!. \n\n Quinto.- Practica las palabras que ya existen en la app!. \n\n Si tienes un problema contactanos")
    }
    
}
/*
func rateApp(){
    if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
    } else {
        guard let url = URL(string: "itms-apps://itunes.apple.com/ru/app/cosmeteria/id1270174484") else {
            return
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}*/
