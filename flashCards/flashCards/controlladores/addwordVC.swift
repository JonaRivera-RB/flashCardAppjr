//
//  addwordVC.swift
//  flashCards
//
//  Created by misael rivera on 30/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class addwordVC: UIViewController {

    @IBOutlet weak var wordTxt: UITextField!
    @IBOutlet weak var traduccionTxt: UITextField!
    @IBOutlet var moreLessbtn: [UIButton]!
    @IBOutlet weak var goalLbl: UILabel!
    var goal = 1
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let alert = UIAlertAction(title: "Ups", style: .default, handler: nil)
            let alertContent = UIAlertController(title: "Datos incompletos 🤕", message: "Al parecer te faltan datos por llenar🤔", preferredStyle: .alert)
            alertContent.addAction(alert)
            present(alertContent, animated: true, completion: nil)
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func moreLessBtnWasPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            if goal != 0 {
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
