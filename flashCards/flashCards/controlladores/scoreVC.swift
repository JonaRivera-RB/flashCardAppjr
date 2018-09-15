//
//  scoreVC.swift
//  flashCards
//
//  Created by misael rivera on 10/09/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData

class scoreVC: UIViewController {
    
    @IBOutlet weak var correctAnswereLbl: UILabel!
    @IBOutlet weak var incorrectAnswerLbl: UILabel!
    @IBOutlet weak var recordLbl: UILabel!
    @IBOutlet weak var learnedLbl: UILabel!
    
    var recordd = 0
    var correct = 0
    var incorrect = 0
    var learned = 0
    
    //conexion con el maaged context para la base de datos
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var totalWords = [Words]()
    //arreglo para traer la cantidad de palabras
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoreDataObjects()
        correctAnswereLbl.text = String(correct)
        incorrectAnswerLbl.text = String(incorrect)
        recordLbl.text = String(recordd)
        learnedLbl.text = String(learned)

    }
    @IBAction func backWasPressed(_ sender: Any) {
        
    }
    @IBAction func tryAgainWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func getData(score:Int, correct:Int, incorrect:Int, learned: Int)
    {
        self.recordd = score
        self.correct = correct
        self.incorrect = incorrect
        self.learned = learned
        let userDefault = UserDefaults.standard.integer(forKey: "recordd")
        if recordd > userDefault {
            UserDefaults.standard.set(recordd, forKey: "recordd")
        }
        recordd = UserDefaults.standard.integer(forKey: "recordd")
    }
    
    func fetchCoreDataObjects() {
        self.loadDataCoreData { (completion) in
            if completion {
                for number in 0 ... totalWords.count-1 {
                    if totalWords[number].goal == totalWords[number].goalCompletion {
                        learned += 1
                    }
                }
            }
        }
    }
    
    func loadDataCoreData(completion: (_ completion:Bool) ->()) {
        let request: NSFetchRequest<Words> = Words.fetchRequest()
        do {
            totalWords = try managedContext.fetch(request)
            completion(true)
            print("Successfully fetched data")
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
            print("error fetched data")
        }
    }
}
