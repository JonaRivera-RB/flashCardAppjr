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
    @IBOutlet weak var learnedLbl: UILabel!
    
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
        learnedLbl.text = String(learned)

    }
    @IBAction func backWasPressed(_ sender: Any) {
        let rootViewGame = self.storyboard?.instantiateViewController(withIdentifier: "viewMain")
        self.present(rootViewGame!, animated: true, completion: nil)
    }
    @IBAction func tryAgainWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func getData( correct:Int, incorrect:Int, learned: Int)
    {
        self.correct = correct
        self.incorrect = incorrect
        self.learned = learned
    }
    
    func fetchCoreDataObjects() {
        let userDefault = UserDefaults.standard.integer(forKey: "learned")
        self.loadDataCoreData { (completion) in
            if completion {
                for number in totalWords  {
                    if number.goal == number.goalCompletion {
                        learned += 1
                    }
                }
                if learned > userDefault {
                    UserDefaults.standard.set(learned, forKey: "learned")
                }
                learned = UserDefaults.standard.integer(forKey: "learned")
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
