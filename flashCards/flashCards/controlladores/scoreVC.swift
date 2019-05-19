//
//  scoreVC.swift
//  flashCards
//
//  Created by misael rivera on 10/09/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData
import SAConfettiView
import GoogleMobileAds

class scoreVC: UIViewController {
    //outlet necesarios
    @IBOutlet weak var correctAnswereLbl: UILabel!
    @IBOutlet weak var incorrectAnswerLbl: UILabel!
    @IBOutlet weak var learnedLbl: UILabel!
    @IBOutlet weak var viewlevel: UIView!
    @IBOutlet weak var yourPoints: UILabel!
    @IBOutlet weak var progressLevel: UIView!
    @IBOutlet weak var level: UILabel!
    //variables necesarias
    var correct = 0
    var incorrect = 0
    var skiped = 0
    var learned = 0
    var levelPts = 10
    var myPts = 0
    var mylevel = 0
    var startValue: Int = 0
    //userdefault
    let userDefaultPoints = UserDefaults.standard
    //variable para la animacion
    var displayLink: CADisplayLink?
    //variable para el confetti
    var confettiView:SAConfettiView?
    //conexion con el maaged context para la base de datos
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //arreglo para traer la cantidad de palabras
    var totalWords = [Words]()
    
    //anuncios
    @IBOutlet weak var bannerView: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoreDataObjects()
        getmyData()
        
        //anuncios
        bannerView.adUnitID = "ca-app-pub-5222742314105921/6585214830"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    //cuando la vista aparezca y transcurra un segundo cargamos la animacion
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1/5), execute: {
            // Put your code which should be executed with a delay here
            self.displayLink = CADisplayLink(target: self, selector: #selector(self.handleUpdate))
            self.displayLink?.add(to: .main, forMode: .default)
        })
    }
    
    //funcion para obtener los datos de como estuvo tu juego
    func getData( correct:Int, incorrect:Int, learned: Int , myPts:Int, skipWord:Int)
    {
        self.correct = correct
        self.incorrect = incorrect
        self.learned = learned
        self.skiped = skipWord
        
        var sumaPre = UserDefaults.standard.integer(forKey: "correct")
        var incorrectPre = UserDefaults.standard.integer(forKey: "incorrect")
        var skipPre = UserDefaults.standard.integer(forKey: "skip")
        sumaPre += correct
        incorrectPre += incorrect
        skipPre += skipWord
        
        UserDefaults.standard.set(sumaPre, forKey: "correct")
        UserDefaults.standard.set(incorrectPre, forKey: "incorrect")
        UserDefaults.standard.set(skipPre, forKey: "skip")
        
        print("mis puntos primer filtro \(self.myPts)")
        self.myPts = userDefaultPoints.integer(forKey: "myPoints")
        
        self.startValue = self.myPts
        
        self.myPts += myPts
        print("mis puntos segundo filtro \(self.myPts)")
        userDefaultPoints.set(self.myPts, forKey: "myPoints")
        self.myPts = userDefaultPoints.integer(forKey: "myPoints")
        
        print("mis puntos tercero filtro \(self.myPts)")
        
    }
    //funcion para detectar toques en la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if confettiView?.isActive() ?? false {
            self.confettiView!.stopConfetti()
            self.confettiView!.removeFromSuperview()
        }
    }
    
    //funcion para obtener los puntos que necesito y el nivel que tengo
    //para traer las correctas las incorrectas y las aprendidas
    func getmyData() {
        if userDefaultPoints.integer(forKey: "pointsNextLevel") != 0 {
            levelPts = userDefaultPoints.integer(forKey: "pointsNextLevel")
        }
        mylevel = userDefaultPoints.integer(forKey: "yourLevel")
        myPts = userDefaultPoints.integer(forKey: "myPoints")
        correctAnswereLbl.text = String(correct)
        incorrectAnswerLbl.text = String(incorrect)
        learnedLbl.text = String(learned)
        level.text = String("Nivel \(mylevel)")
        yourPoints.text = String("\(startValue) / \(levelPts) Puntos")
        for constraint in self.progressLevel.constraints {
            if constraint.identifier == "levelwidth" {
                constraint.constant = (self.view.frame.size.width * 0.80)/CGFloat(self.levelPts) * CGFloat(self.startValue)
            }
        }
    }
    
    //buscamos en cada una de las constrains de la abrra de progresos
    //si el identificador del constrainr es igual a barWidht
    //entonces cambio el valor
    @objc func handleUpdate() {
        yourPoints.text = String("\(startValue) / \(levelPts) Puntos")
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
            print("mis puntos cuarto filtro \(self.myPts)")
            myPts -= levelPts
            print("mis puntos quinto filtro \(self.myPts)")
            userDefaultPoints.set(self.myPts, forKey: "myPoints")
            self.myPts = userDefaultPoints.integer(forKey: "myPoints")
            
            print("mis puntos sexto filtro \(self.myPts)")
           calculateNextLevelPts()
            level.text = String("New level \(mylevel)")
        }
        if startValue > myPts {
            startValue = myPts
        }
    }
    //funcion para calculos el siguiente nivel
    //convertimos los puntos a bouble obtenemos el 20 porciento y  se lo suma a los puntos necesarios para alcanzar un nuevo nivel
    //configuramos los puntos que se necesitan para el nuevo nivel
    //configuramos el nivel del usuario
    func calculateNextLevelPts(){
        var necessaryPoints:Double = (Double(levelPts) * 20)/100
        necessaryPoints = round(necessaryPoints)
        levelPts += Int(necessaryPoints)
        mylevel += 1
        
        userDefaultPoints.set(levelPts, forKey: "pointsNextLevel")
        levelPts = userDefaultPoints.integer(forKey: "pointsNextLevel")
        
        userDefaultPoints.set(mylevel, forKey: "yourLevel")
        mylevel = userDefaultPoints.integer(forKey: "yourLevel")
        addConfetti()
    }
    //funcion para añadir confetti
    func addConfetti(){
        confettiView = SAConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView!)
        confettiView!.intensity = 0.50
        confettiView!.type = .Confetti
        confettiView!.startConfetti()
    }
    //funcion para regresar a la pagina principal
    @IBAction func backWasPressed(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //funcion para regresar a la pagina de jugar de nuevo
    @IBAction func tryAgainWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension scoreVC {
    //funcion para recuperar los datos de la base de datos de las palabras aprendidas
    //si la funcion regresa un true de que todo corrio perfecto
    //hacemos un ciclo de el total de palabras y preguntamos si la palabra en su propiedad meta
    //es igual al numero que se habia proponido aprender
    //si si es igual, ah aprendidas le sumamos 1
    //si aprendidas es mayor a lo que ya tiene guardado
    //le configuramos un nuevo valor y le devolvemos ese valor a la variable aprendido
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
    //funcion para obtener los datos de la base de datos
    //donde hacemos una peticion a la base de datos de nombre "Words
    //intentamos recuperar las palabras si se realiza correctamente devuleve un true
    //si no atrapa el error y devuelve un false
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

