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

class myGroupsVC: UIViewController {
    
    @IBOutlet weak var grupuTableView: UITableView!
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myGroups:[Groups] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grupuTableView.delegate = self
        grupuTableView.dataSource = self
        grupuTableView.isHidden = false
    }
    //cuando la vista carge mandamos a llamar la funcion para traer datos de la base de datos
    override func viewWillAppear(_ animated: Bool) {
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
        let txt = alert.addTextField("Enter the name of your category")
        alert.addButton("Save") {
            if txt.text != "" {
                let group = Groups(context: self.managedContext)
                group.group = txt.text!
                
                group.color = self.getRandomColor()
                self.myGroups.append(group)
                self.grupuTableView.isHidden = false
                self.grupuTableView.reloadData()
                //mandar a verificar si ya no tenemos datos
                self.saveInCoreData()
            }
            else {
                self.showAlert()
            }
            }
            print("Text value: \(txt.text!)")
        alert.showEdit("New category", subTitle: "What is the name of your category?")
        
       
        // Add a text field
        /*
        var nameGroup = UITextField()
        
        let alertController = UIAlertController(title: "Nuevo grupo", message: "Nombre de tu grupo?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (alertAction) in
            if nameGroup.text != "" {
            let group = Groups(context: self.managedContext)
            group.group = nameGroup.text!
            
            group.color = self.getRandomColor()
            self.myGroups.append(group)
            self.grupuTableView.isHidden = false
            self.grupuTableView.reloadData()
            //mandar a verificar si ya no tenemos datos
            self.saveInCoreData()
            }
            else {
                self.showAlert()
            }
        }
 
        alertController.addTextField { (textFieldGroup) in
            textFieldGroup.placeholder = "Nombre de tu nuevo grupo"
            nameGroup = textFieldGroup
        }
        let alertActionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true)
        */
    }
    //funcion para mostrar alert d que faltaron datos
    func showAlert() {
        SCLAlertView().showError("Ups", subTitle: "You have to name your category")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? groupCell else { return UITableViewCell() }
        let group = myGroups[indexPath.row]
        cell.configureGroupCell(forGroupName: group)
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
        let wordsVC = segue.destination as! myWordsVC
        if let indexPath = grupuTableView.indexPathForSelectedRow {
            wordsVC.selectedGroup = myGroups[indexPath.row]
        }
    }
    
}
