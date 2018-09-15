//
//  myGroupsVC.swift
//  flashCards
//
//  Created by misael rivera on 16/08/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData

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
    
    override func viewWillAppear(_ animated: Bool) {
       fetchCoreDataObjects()
    }
    
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
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    @IBAction func addGroupBtnWasPressed(_ sender: Any) {
        var nameGroup = UITextField()
        
        let alertController = UIAlertController(title: "Nuevo grupo", message: "Nombre de tu grupo?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (alertAction) in
            let group = Groups(context: self.managedContext)
            if nameGroup.text != "" {
            group.group = nameGroup.text!
            } else {
                group.group = "No name"
            }
            group.color = self.getRandomColor()
            self.myGroups.append(group)
            self.grupuTableView.isHidden = false
            self.grupuTableView.reloadData()
            //mandar a verificar si ya no tenemos datos
            self.saveInCoreData()
        }
        alertController.addTextField { (textFieldGroup) in
            textFieldGroup.placeholder = "Nombre de tu nuevo grupo"
            nameGroup = textFieldGroup
        }
        let alertActionCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true)
        
    }
    
    @IBAction func exitBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
func saveInCoreData() {
    do {
        try managedContext.save()
    } catch {
        print("error al guardar")
    }
}
    
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



extension myGroupsVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? groupCell else { return UITableViewCell() }
        let group = myGroups[indexPath.row]
        cell.configureGroupCell(forGroupName: group)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGroup(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return[deleteAction]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showWords", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wordsVC = segue.destination as! myWordsVC
        if let indexPath = grupuTableView.indexPathForSelectedRow {
            wordsVC.selectedGroup = myGroups[indexPath.row]
        }
    }
    
}
