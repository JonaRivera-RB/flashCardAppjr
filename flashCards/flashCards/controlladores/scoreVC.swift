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
    @IBOutlet weak var viewlevel: UIView!
    @IBOutlet weak var yourPoints: UILabel!
    @IBOutlet weak var progressLevel: UIView!
    
    var correct = 0
    var incorrect = 0
    var learned = 0
    var levelPts = 20
    var myPts = 30
    
    var startValue: Int = 0
    
    var displayLink: CADisplayLink?
     let shapeLayer = CAShapeLayer()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink?.add(to: .main, forMode: .default)
    }
    
    //buscamos en cada una de las constrains de la abrra de progresos
    //si el identificador del constrainr es igual a barWidht
    //entonces cambio el valor
    @objc func handleUpdate() {
        yourPoints.text = String("\(startValue) / \(levelPts)")
        for constraint in self.progressLevel.constraints {
            if constraint.identifier == "levelwidth" {
                 constraint.constant = (self.view.frame.size.width * 0.80)/CGFloat(self.levelPts) * CGFloat(self.startValue)
            }
        }
        startValue += 1
        //si valor inicial es mayor o igual que los puntos requeridos para subir de nivel
        //restame los puntos, subeme de nivel y sube puntos para obtener nivel nuevo
        if startValue >= levelPts {
            startValue = 0
            myPts -= levelPts
            levelPts = 30
            
        }
        if startValue > myPts {
            startValue = myPts
        }
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
