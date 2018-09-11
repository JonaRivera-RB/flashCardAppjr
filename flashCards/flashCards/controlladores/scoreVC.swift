//
//  scoreVC.swift
//  flashCards
//
//  Created by misael rivera on 10/09/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class scoreVC: UIViewController {
    
    @IBOutlet weak var correctAnswereLbl: UILabel!
    @IBOutlet weak var incorrectAnswerLbl: UILabel!
    @IBOutlet weak var recordLbl: UILabel!
    @IBOutlet weak var learnedLbl: UILabel!
    
    var recordd = 0
    var correct = 0
    var incorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswereLbl.text = String(correct)
        incorrectAnswerLbl.text = String(incorrect)
        recordLbl.text = String(recordd)

    }
    @IBAction func backWasPressed(_ sender: Any) {
        
    }
    @IBAction func tryAgainWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func getData(score:Int, correct:Int, incorrect:Int)
    {
        self.recordd = score
        self.correct = correct
        self.incorrect = incorrect
        
        let userDefault = UserDefaults.standard.integer(forKey: "recordd")
        if recordd > userDefault {
            UserDefaults.standard.set(recordd, forKey: "recordd")
        }
        recordd = UserDefaults.standard.integer(forKey: "recordd")
    }
}
