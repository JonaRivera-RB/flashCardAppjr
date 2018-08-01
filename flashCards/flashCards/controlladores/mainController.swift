//
//  mainController
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class mainController: UIViewController {

    var words:Int = 0
    
    @IBOutlet weak var mensageLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        words = UserDefaults.standard.integer(forKey: "mywords")
        if words == 0 {
            mensageLbl.text = "Aun no tienes palabras por estudiar 😭"
        } else {
            mensageLbl.text = "Memoriza tus palabras, tienes \(words) por aprender. 🤓"
        }
    }
    @IBAction func playBtnWasPressed(_ sender: Any) {
        if words == 0 {
            print("no hay palabras")
        }
        else {
            print("nueva pantalla")
        }
    }
}

