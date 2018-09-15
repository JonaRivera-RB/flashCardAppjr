//
//  myGameVC.swift
//  flashCards
//
//  Created by misael rivera on 02/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData

class myGameVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var answerTxt: UITextField!
    @IBOutlet weak var acepBtn: vistaBotones!
    @IBOutlet weak var viewMove: sombraVista!
    @IBOutlet weak var cargarViewGame: UIView!
    
    var words:[Words]!
    
    var numberWord:Int = 0
    var lado:Bool!
    var learned = 0
    var selectedGroup2 : Groups?
    var switchOn:Bool = false
    var correctAnswer = 0
    var incorrectanswer = 0
    var record  = 0
    
    
    override func viewDidLoad() {
        print("grupo",selectedGroup2!.group!)
        super.viewDidLoad()
        answerTxt.delegate = self
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    //hacemos una peticion a la base de datos
    //al txt le agregamos una funcion para detectar si el usuario ya ingreso palabras o no
    override func viewWillAppear(_ animated: Bool) {
        updateVaribles()
        fetchCoreDataObjects()
        updateViews()
        answerTxt.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    func updateVaribles(){
        learned = 0
        numberWord = 0
        correctAnswer = 0
        incorrectanswer = 0
        record = 0
        wordLbl.text = ""
    }
    //por medio de esta funcion le decimos al txt que si el txt esta vacio el boton se ponga no disponible
    //pero si el usuario ya ingreso datos que se ponga disponible
    @objc func textFieldDidChange(textField: UITextField) {
        if (answerTxt.text?.isEmpty)!{
            acepBtn.isEnabled = false
            acepBtn.alpha = 0.5
        }else{
            acepBtn.isEnabled = true
            acepBtn.alpha = 1
        }
    }
    //verificamos que la peticion a la base de datos se hizo correctamente
    //preguntamos si words es mayor o igual si es correcto ejecutamos la funcion nextWord()
    //si no es asi mostramos una alerta
    func fetchCoreDataObjects(){
        self.fetch { (completion) in
            if completion {
                if words.count >= 1{
                    nextWord()
                }
            }
            else {
            print("error")
            }
            }
        }
    //funcion para iniciar a jugar
    //preguntamos si el numero de palabras es menor que la cantidad de palabras
    //si es menor entonces introducimos en el lbl word la palabra que tiene el array words en la posicion numerWord
    func nextWord() {
            if numberWord < words.count {
                //mexicanada
                if words[numberWord].goal != words[numberWord].goalCompletion {
                    switchOn = getProbability()
                    
                    if switchOn == false {
                        wordLbl.text = words[numberWord].word
                    }
                        
                    else if switchOn {
                        wordLbl.text = words[numberWord].translate
                    }
                }
                else {
                    learned += 1
                    numberWord += 1
                    updateLbl()
                    nextWord()
                }
            }
                else {
                    performSegue(withIdentifier: "showScore", sender: self)
                
        }
    }
    
    func getProbability() -> Bool{
        let randomInt = Int(arc4random_uniform(10) + 1)
        print("el numero que obtengo -> \(randomInt)")
        if randomInt < 8 {
            return false
        }
        else {
            return true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let myScoreVC = segue.destination as? scoreVC {
            myScoreVC.getData(score: record, correct: correctAnswer, incorrect: incorrectanswer, learned: learned)
        }
    }
    //funcion para actualizar vistas, txt y botones
    func updateLbl() {
        answerTxt.text = ""
        acepBtn.isEnabled = false
        acepBtn.alpha = 0.5
    }
    //no estoy seguro para que se necesite esto pero no borrar 
    @IBAction func answerWasType(_ sender: Any) {
      
    }
    //funcion donde indica que el boton de regresar fue presionado
    //y mostramos una alerta
    @IBAction func backBtnWasPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Estas seguro?", message: "Estas seguro que quieres salir?, perderas todo tu progreso.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let alertAction2 = UIAlertAction(title: "Ok", style: .default) { (alertAction2) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        present(alert, animated: true, completion: nil)
    }
    //boton de aceptar fue presionado y verificamos la respuesta y al numero de palabra de sumamos 1
    //despues de checar la respuesta
    //actualizamos los lbl txt botones
    //actualizamos la barra de progreso
    //iniciamos el juego de neuvo
    //le damos color al texto y fondo
    //si el lado es true lo giramos a la derecha y si no a al izquierda
    @IBAction func acepBtnWasPressed(_ sender: Any) {
        checkAnswer()
        numberWord += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.updateLbl()
            self.updateViews()
            self.nextWord()
            self.wordLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.viewMove.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if self.lado {
                self.transitionRight()
            } else {
                self.transitionLeft()
            }
        }
        
    }
    //boton para saltar pregunta
    @IBAction func skipBtanWasPressed(_ sender: Any) {
        numberWord += 1
        updateViews()
        updateLbl()
        nextWord()
    }
    //funcion para checar respuesta
    //creamos una constante para obtener la respuesta correcta
    //verificamos que el txt no este vacio
    //preguntamos si la respuesta es igual a la respuesta del array
    //si es correcta giramos la carta hacia la izquierda y cambiamos color de texto y fondo y escribimos un mensaje
    //cambiamos valor de lado
    func checkAnswer() {
        var correctAnswer = ""
        
        if switchOn == false {
            //wordLbl.text = words[numberWord].word
            correctAnswer = words[numberWord].translate!
        }
            
        else if switchOn {
            correctAnswer = words[numberWord].word!
        }
        
        if answerTxt.text != "" {
            if correctAnswer == answerTxt.text
            {
                setProgress(atNumber: self.numberWord)
                self.correctAnswer += 1
                self.record += 1
                self.transitionLeft()
                print("correcto")
                wordLbl.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                viewMove.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
                wordLbl.text = "correcto!"
                lado = true
            }
            else {
                self.incorrectanswer += 1
                print("incorrecto")
                transitionRight()
                wordLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                viewMove.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                wordLbl.text = "incorrecto!"
                lado = false
            }
        }
        }

    func transitionLeft() {
        UIView.transition(with: viewMove, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func transitionRight() {
        UIView.transition(with: viewMove, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    //funcion para ir cambiando la barra de estado
    func updateViews() {
        for constraint in self.cargarViewGame.constraints {
            if constraint.identifier == "barWidht" {
            constraint.constant = (self.view.frame.size.width * 0.70)/CGFloat(self.words.count) * CGFloat(self.numberWord)
        }
    }
    }
}

extension myGameVC {
    //funcion para editar el progreso
    func setProgress(atNumber number:Int) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = words[number]
        
        if chosenGoal.goal < chosenGoal.goalCompletion {
            chosenGoal.goal = chosenGoal.goal + 1
        } else {
            return
        }
        
        do {
            try managedContext.save()
        } catch  {
            debugPrint("Could not set progress:\(error.localizedDescription)")
        }
    }
    
    //funcion para obtener los datos de la base de datos
    func fetch(completion: (_ completion: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Words>(entityName: "Words")
        let predicate = NSPredicate(format: "wordsRelation.group MATCHES %@", selectedGroup2!.group!)
        fetchRequest.predicate = predicate
        do {
            words = try managedContext.fetch(fetchRequest)
            
            print("successfully fetched data")
            completion(true)
        } catch {
            debugPrint("could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}