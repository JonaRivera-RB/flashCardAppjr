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
