//
//  mainController
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//
//hacer peticion al cargar la vista si no tiene datos no hay que mostrar
import UIKit
import CoreData


class mainController: UIViewController {
    //arreglo para traer todas las palabras
    var totalWords = [Words]()
    //arreglo para traer la cantidad de palabras
    var total:Int = 0
    //arreglo para todos los grupos
    var groupsSheet = [Groups]()
    //variable para el grupo seleccionado el cual lo mandamos a la siguiente vista
    var selectedGroup:Groups!
    //arreglo para traer las palabras que tiene un grupo en especifico
    var words=[Words]()
    
    var wordsForLearn=[Words]()
    //conexion con el maaged context para la base de datos
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var mensageLbl: UILabel!
    @IBOutlet weak var groupsPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsPicker.delegate = self
        groupsPicker.dataSource = self
    }
    
    //cuando la vista carga hacemos una peticion a la base de datos para traer las palabras
    //y para traer los grupos
    //hacemos un reload del picker para agregar todos los nuevos grupos
    override func viewWillAppear(_ animated: Bool) {
        fetchCoreDataObjects()
        fetchCoreDataObjectsGroups()
        groupsPicker.reloadAllComponents()
        
        //preguntamos si el array de grupos es mayor que cero
        //y si si seleccionamos por defecto la posicion 0
        if groupsSheet.count > 0 {
            groupsPicker.selectRow(0, inComponent: 0, animated: true)
            selectedGroup = groupsSheet[0]
        }
        //preguntamos si el total de palabras es igual a 0 mostramos mensaje en el lbl mensaje
        //si no mostramos otro mensaje
        if total == 0 {
            mensageLbl.text = "Aun no tienes palabras por estudiar 😭"
        } else {
            mensageLbl.text = "Memoriza tus palabras, tienes \(total) por aprender. 🤓"
        }
    }
    
    @IBAction func statisticsBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "showStatistics", sender: self)
    }
    
    //funcion para el boton cuando es presionado
    //mostramos alerta si el numero de palabras es igual a 0
    //si no es cero, hacemos una peticion a la base de datos para saber si ese grupo tiene palabras o no
    @IBAction func playBtnWasPressed(_ sender: Any) {
        if total == 0 {
            showAlert(forAlextText: "Tienes que agregar palabras antes de poder jugar.")
        }
        else {
        fetchCoreDataObjectsGroupsWords()
        }
    }
    //funcion para crear una alerta
    func showAlert(forAlextText alertText:String){
        let alert = UIAlertController(title: "Ups", message: alertText, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
   
    @IBAction func showWordsBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "showWords", sender: self)
    }
    
    //preparamos la vista para pasar a la siguiente preguntamos si tiene como destino la vista
    //mygamevc y le mandamos el grupo seleccionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let myPlayVC = segue.destination as? myGameVC {
            myPlayVC.selectedGroup2 = selectedGroup
            myPlayVC.wordsForLearn = wordsForLearn
        }
    }
    
    //funcion para verificar que la peticion a la base de datos se hizo correctamnete sin ningun error
    //esta funcion se hace al inicio cuando carga la app
    //y le pasamos el numero total de palabras del array a la variable total
    func fetchCoreDataObjects() {
        self.loadDataCoreData { (completion) in
            if completion {
                if totalWords.count >= 1 {
                    total = totalWords.count
                } else {
                    total = 0
                }
            }
        }
    }
    
    //funcion para verificar que la peticion a la base de datos se hizo correctamnete sin ningun error
    //esta funcion se hace al inicio cuando carga la app
    //preguntamos si los grupos que obtuvo de la base de datos y las palabras son mayor o iguala  1
    //muestra el picker si no no
    func fetchCoreDataObjectsGroups() {
        self.loadDataCoreDataGroups { (completion) in
            if completion {
                if groupsSheet.count >= 1 && totalWords.count >= 1 {
                    groupsPicker.isHidden = false
                } else {
                    groupsPicker.isHidden = true
                }
            }
        }
        }
    
    //funcion para verificar que la peticion a la base de datos se hizo correctamnete sin ningun error
    //vaciamos el array
    //creamos una variable temporal para llevar un conteo
    //esta funcion se hace al oprimir el boton de jugar
    //hacemos un ciclo para verificar si tenemos palabras por aprender
    //donde si la meta aun no se ha completado la sumamos como palabra por aprender
    
    //preguntamos si el numero total de palabras por aprender que contiene ese grupo es mayor de 3
    //pasamos a la vista del juego
    //si no mostramos un alerta donde agregar mas palabras
    
    //si no tenemos ninguna palabra por aprneder muestra una alerta donde diga que agrege palabras a la categoria
    func fetchCoreDataObjectsGroupsWords() {
        var wordForLearn = 0
        wordsForLearn = [Words]()
        self.loadDataCoreDataGroup { (completion) in
            if completion {
                for word in words {
                    if word.goal != word.goalCompletion {
                        wordForLearn += 1
                        wordsForLearn.append(word)
                    }
                }
                if wordForLearn >= 3 {
                    if wordForLearn >= 15 {
                            self.getWordsRandom()
                    }
                        performSegue(withIdentifier: "showPlay", sender: self)
                } else {
                    self.showAlert(forAlextText: "Tienes que agregar mas palabras antes de poder jugar.")
                }
            }
                else {
                self.showAlert(forAlextText: "Tienes que agregarle palabras a esta categoria antes de poder jugar.")
                }
            }
        }
    func getWordsRandom(){
        var arrayTemp:[Words] =  wordsForLearn
        wordsForLearn = [Words]()
        var numberTemp:Int = 0
        for _ in 0 ..< 15 {
            numberTemp = Int(arc4random_uniform(UInt32(arrayTemp.count)))
            wordsForLearn.append(arrayTemp[numberTemp])
            arrayTemp.remove(at: numberTemp)
        }
    }
    
    //funcion para hacer la peticion a la base de datos
    //donde hacemos una peticion a la base de datos Words
    //para obtener todas las palabras
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
    //funcion para hacer la peticion a la base de datos
    //donde hacemos una peticion a la base de datos Groups
    //para obtener todas las grupos
    func loadDataCoreDataGroups(completion: (_ completion:Bool) ->()) {
        let request: NSFetchRequest<Groups> = Groups.fetchRequest()
        do {
            groupsSheet = try managedContext.fetch(request)
            completion(true)
            print("Successfully fetched data")
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
            print("error fetched data")
        }
    }
    //funcion para hacer la peticion a la base de datos
    //donde hacemos una peticion a la base de datos Words donde introducimos un filtrado para obtener
    //solo el numero de palabras que tengan la relacion con el grupo
    func loadDataCoreDataGroup(with request: NSFetchRequest<Words> = Words.fetchRequest(), completion: (_ completion: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        // let fetchRequest = NSFetchRequest<Words>(entityName: "Words")
        let predicate = NSPredicate(format: "wordsRelation.group MATCHES %@", selectedGroup!.group!)
        request.predicate = predicate
        do {
            words = try managedContext.fetch(request)
            print("successfully fetched data")
            completion(true)
        } catch {
            debugPrint("could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}
//extension para el picker
extension mainController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groupsSheet.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groupsSheet[row].group
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGroup = groupsSheet[row]
    }
    
}

