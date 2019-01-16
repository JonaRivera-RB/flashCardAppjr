//
//  myWordsVC.swift
//  flashCards
//
//  Created by misael rivera on 26/07/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData

//improtante crear esto para poder utilizar core data
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class myWordsVC: UIViewController {

    @IBOutlet weak var addWordBtn: vistaBotones!
    @IBOutlet weak var wordsTableView: UITableView!
    @IBOutlet weak var noWordsLbl: UILabel!
    @IBOutlet weak var viewUndo: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var viewLearned: UIView!
    
    var words = [Words]()
    var wordSave:Words!
    var selectedGroup : Groups?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordsTableView.delegate = self
        wordsTableView.dataSource = self
        wordsTableView.isHidden = false
        viewUndo.alpha = 0.0
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        wordsTableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetch { (completion) in
            if completion {
                if words.count >= 1 {
                    UserDefaults.standard.integer(forKey: "mywords")
                    UserDefaults.standard.set(words.count , forKey: "mywords")
                    wordsTableView.isHidden = false
                }
             else {
                    UserDefaults.standard.set(0, forKey: "mywords")
                    wordsTableView.isHidden = true
            }
        }
    }
    }
    
    @IBAction func addWordBtnWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "addWord", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wordVC = segue.destination as! addwordVC
        wordVC.grupoSeleccionado = selectedGroup!
    }
    
    @IBAction func backBtnWassPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        viewUndo.alpha = 0.0
        viewUndo.isHidden = true
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.undoManager?.undo()
        fetchCoreDataObjects()
        wordsTableView.reloadData()
    }
}
//Creamos una extension de la clase mywordsVC para crear lo de la tableView
extension myWordsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creamos una constante que hace refernecia al diseño de la table
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? WordCell else {return UITableViewCell() }
        let word = words[indexPath.row]
        //configuramos la celda con lo que telga la constante word y lo regresamos
        cell.configureCell(word: word)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let learnedWord = UITableViewRowAction(style: .normal, title: "LEARNED") { (rowAction, indexPath) in
            //marcar omo aprendida
            tableView.reloadData()
        }
        learnedWord.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "ELIMINAR") { (rowAction, indexPath) in
            self.removeWord(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1490196078, blue: 0, alpha: 1)
        return[deleteAction,learnedWord]
    }
}
extension myWordsVC {
    func fadeOutView(view: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
            view.alpha = 0.0
        }, completion: { (true) in
            self.cancelBtn.isHidden = true
        })
    }
    
    func fadeInView(view: UIView) {
        UIView.animate(withDuration: 3.0) {
            view.alpha = 1.0
        }
    }
    
    //funcion para eliminar los datos de la base de datos
    func removeWord(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        //eliminamos lo que tenga señalado
        managedContext.undoManager = UndoManager()
        managedContext.delete(words[indexPath.row])
        //guardamos de nuevo
        do {
            try managedContext.save()
            cancelBtn.isHidden = false
            viewUndo.isHidden = false
            fadeInView(view: viewUndo)
            fadeOutView(view: viewUndo)
            print("seccessfully remove word")
        } catch {
            debugPrint("could not remove word: \(error.localizedDescription)")
            
        }
    }
    
    //funcion para obtener los datos de la base de datos
    func fetch(with request: NSFetchRequest<Words> = Words.fetchRequest(), completion: (_ completion: Bool) ->()) {
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
