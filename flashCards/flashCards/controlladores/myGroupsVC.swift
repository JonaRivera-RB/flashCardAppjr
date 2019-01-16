//
//  myGroupsVC.swift
//  flashCards
//
//  Created by misael rivera on 16/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData
import SCLAlertView
import GoogleMobileAds

class myGroupsVC: UIViewController {
    
    @IBOutlet weak var grupuTableView: UITableView!
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var myGroups:[Groups] = []
    
    //arreglo para traer todos las palabras:
    var totalWords = [Words]()
    //variable para traer la cantidad de palabras
    var total:Int = 0
    //variable para el grupo seleccionado el cual lo mandamos a la siguiente vista
    var selectedGroup:Groups!
    //arreglo para traer las palabras que tiene un grupo en especifico
    var words=[Words]()
    var wordsForLearn=[Words]()
    //anuncios
    
    var interstitial: GADInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        grupuTableView.delegate = self
        grupuTableView.dataSource = self
        grupuTableView.isHidden = false
    }
    //cuando la vista carge mandamos a llamar la funcion para traer datos de la base de datos
    override func viewWillAppear(_ animated: Bool) { //anuncio
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-5222742314105921/4884834943")
        let request = GADRequest()
        interstitial.load(request)
       fetchCoreDataObjects()
    }
    //creamos funcion para mandar a llamar los datos de la base de datos y revisar que todo salio bien
    //mandamos a traer los datos de la base de datos
    //si todo salio bien preguntamos si grupos es mayor que 0 entonces mostramos la tabla
    //si no la ocultamos
    func fetchCoreDataObjects() {
        self.loadDataCoreData { (completion) in
            if completion {
                if myGroups.count >= 1 {
                    grupuTableView.isHidden = false
                }
                else {
                    grupuTableView.isHidden = true
                }
            }
        }
    }
    //funcion para obtener un numero rando
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    //funcion para añadir un nuevo grupo a la base de datos
    //creamos variable de tipo textField para obtener el nombre que le pondremos al grupo
    //creamos la alerta y le agremaos una accion al momento de darle ok
    //validamos que grupo sea diferente de vacio
    //traemos los datos de la base de datos y le agregamos uno nuevo
    //lo actualizamos mediante la funcion saveincoreData
    //creamos un alertController.addTextField para añadir el textfield y le pasamos valores al placeholder
    //y recibimos el nombre mediante namegroup
    @IBAction func addGroupBtnWasPressed(_ sender: Any) {
    
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
       // let alert = SCLAlertView()
        //SCLAlertView().showError("Hello Error", subTitle: "This is a more descriptive error text.")
        //("Enter the name of your category")
        let txt = alert.addTextField("Introduce el nombre de tu categoria")
        alert.addButton("Guardar") {
            if txt.text != "" {
                let group = Groups(context: self.managedContext)
                group.group = txt.text!
                
                group.color = self.getRandomColor()
                self.myGroups.append(group)
                self.grupuTableView.isHidden = false
                self.grupuTableView.reloadData()
                //mandar a verificar si ya no tenemos datos
                self.saveInCoreData()
                if self.interstitial.isReady {
                    self.interstitial.present(fromRootViewController: self)
                } else {
                    print("Ad wasn't ready")
                }
            }
            else {
                self.showAlert()
            }
            }
            print("Text value: \(txt.text!)")
        //alert.showEdit("New category", subTitle: "What is the name of your category?")
        alert.showEdit("Nueva categoria", subTitle: "Cual es el nombre de tu categoria?")
    }
    
    //funcion para mostrar alert d que faltaron datos
    func showAlert() {
        if self.interstitial.isReady {
            self.interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        SCLAlertView().showError("Ups", subTitle: "Tu tienes que nombrar tu categoria")
    }
    //funcion para guardar en la base de datos
func saveInCoreData() {
    do {
        try managedContext.save()
    } catch {
        print("error al guardar")
    }
}
    //funcion para traer los datos de la base de datos
    func loadDataCoreData(completion: (_ completion:Bool) ->()) {
        let request: NSFetchRequest<Groups> = Groups.fetchRequest()
        do {
            myGroups = try managedContext.fetch(request)
            completion(true)
            print("Successfully fetched data")
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
            print("error fetched data")
        }
      //  grupuTableView.reloadData()
    }
    //funcion para eliminar los datos de la base de datos
    func removeGroup(atIndexPath indexPath: IndexPath) {
        managedContext.undoManager = UndoManager()
        managedContext.delete(myGroups[indexPath.row])
        
        
        do {
            try managedContext.save()
            print("successfully remove group")
        } catch {
            debugPrint("could not remove group: \(error.localizedDescription)")
        }
    }
    
}



//creamos una extension de myGroupsVC para la tabla
extension myGroupsVC : UITableViewDelegate, UITableViewDataSource {
    //devolvemos el numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //devolvemos el numero total de elementos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    //devolvemos el contenido que tedra cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell" , for: indexPath) as? GroupCell else { return UITableViewCell() }
    
        let group = myGroups[indexPath.row]
        cell.configureGroupCell(forGroupName: group)
      cell.playBtn.addTarget(self, action: #selector(playBtnWasPressed(_:)), for: .touchUpInside)
        return cell

    }
    
    //le decimos que podemos editar la tabla
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //le decimos que no tendra ningun estilo por defecto
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    //creamos la opcion para poder eliminar el grupo y le pasamos como referencia la celda que queremos eliminar
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGroup(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return[deleteAction]
    }
    //creamos codigo para poder entrar a la siguiente vista y me muestre lo que necesito ver
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showWords", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //preparamos la siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let wordsVC = segue.destination as? myWordsVC {
            if let indexPath = grupuTableView.indexPathForSelectedRow {
                wordsVC.selectedGroup = myGroups[indexPath.row]
            }
        }
       
        
        else if let myPlayVC = segue.destination as? gameVC {
            myPlayVC.initWords(myWords: wordsForLearn, groupSelected: selectedGroup)
        }
    }
    @IBAction func playBtnWasPressed(_ button: UIButton) {
        if let indexPath = self.grupuTableView.indexPathForView(button) {
            selectedGroup = myGroups[indexPath.row]
            fetchCoreDataObjectsGroupsWords()
        }
        else {
            print("Button indexPath not found")
        }
    }
    
}

extension myGroupsVC {

    
    func fetchCoreDataObjectsGroupsWords() {
        var wordForLearn = 0
        wordsForLearn = [Words]()
        self.loadDataCoreDataGroup { (completion) in
            if completion {
                for word in words {
                    if word.goal != 1 {
                        wordForLearn += 1
                        wordsForLearn.append(word)
                    }
                }
                if wordForLearn >= 3 {
                    if wordForLearn >= 15 {
                       // self.getWordsRandom()
                    }
                    print("jugar!")
                    //showPlay
                   performSegue(withIdentifier: "showPlay", sender: self)
                } else {
                    let appearance = SCLAlertView.SCLAppearance(
                        showCloseButton: false
                    )
                    let alert = SCLAlertView(appearance: appearance)
                    alert.addButton("Okay") {
                        if self.interstitial.isReady {
                            self.interstitial.present(fromRootViewController: self)
                        } else {
                            print("Ad wasn't ready")
                        }
                    }
                    alert.showInfo("Ups", subTitle: "Tienes que agregar mas palabras para jugar")
                }
            }
            else {
                SCLAlertView().showInfo("Ups", subTitle: "Tienes que agregar mas palabras para jugar")
            }
        }
    }
    
    
    //funcion para hacer la peticion a la base de datos
    //donde hacemos una peticion a la base de datos Words donde introducimos un filtrado para obtener
    //solo el numero de palabras que tengan la relacion con el grupo
    func loadDataCoreDataGroup( with request: NSFetchRequest<Words> = Words.fetchRequest(), completion: (_ completion: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        // let fetchRequest = NSFetchRequest<Words>(entityName: "Words")
        let predicate = NSPredicate(format: "wordsRelation.group MATCHES %@", selectedGroup!.group!)
        //myGroups[indexPath.row] selectedGroup!.group!
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
