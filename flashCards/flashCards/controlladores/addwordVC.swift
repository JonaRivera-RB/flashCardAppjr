//
//  addwordVC.swift
//  flashCards
//
//  Created by misael rivera on 30/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import SCLAlertView
import GoogleMobileAds

class addwordVC: UIViewController {
    
    @IBOutlet weak var wordTxt: UITextField!
    @IBOutlet weak var traduccionTxt: UITextField!
    @IBOutlet var moreLessbtn: [UIButton]!
    @IBOutlet weak var goalLbl: UILabel!
    var goal = 5
    var grupoSeleccionado:Groups!
    
    //anuncios
    @IBOutlet weak var bannerView: GADBannerView!
    var interstitial: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        //anuncios
        bannerView.adUnitID = "ca-app-pub-5222742314105921/6585214830"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-5222742314105921/4884834943")
        let request = GADRequest()
        interstitial.load(request)
        
        
        goalLbl.text = String(goal)
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    
    //Descomentar, si el tap no debe interferir o cancelar otras acciones
    //tap.cancelsTouchesInView = false
    
    view.addGestureRecognizer(tap)
}

@ objc func dismissKeyboard() {
    //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
    view.endEditing(true)
}

    @IBAction func saveWordBtnWasPressed(_ sender: Any) {
        if wordTxt.text != "" && traduccionTxt.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        else {
            //showWarning("Incomplete data", subTitle: "Apparently your data is incomplete 🤔")
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            SCLAlertView().showWarning("Datos incompletos", subTitle: "Alparecer tus datos estan incompletos 🤔")
            
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func moreLessBtnWasPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            if goal != 5 {
                goal -= 1
                goalLbl.text = String(goal)
            }
        }
        else {
            goal += 1
            goalLbl.text = String(goal)
        }
        }
    func save(completion: (_ finished:Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let word = Words(context: managedContext)
        
        word.word = wordTxt.text
        word.translate = traduccionTxt.text
        word.goal = Int32(0)
        word.goalCompletion = Int32(goalLbl.text!)!
        word.wordsRelation = grupoSeleccionado
        do {
            try managedContext.save()
            print("successfully saved data")
            completion(true)
        } catch  {
            debugPrint("could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
    
    
    
    
    
    }
