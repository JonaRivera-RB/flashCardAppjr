//
//  WordsLoadInTheAppVC.swift
//  flashCards
//
//  Created by Misael Rivera on 12/15/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class WordsLoadInTheAppVC: UIViewController {
    @IBOutlet weak var wordsTableView2: UITableView!
    
    var selectedGroup2:WordsBankStruck?
    var indexPathOfMyTable = [IndexAndStatus]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordsTableView2.delegate = self
        wordsTableView2.dataSource = self
    }
    @IBAction func backBtn2WassPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func transitionLeft(view:UIView) {
     UIView.transition(with: view, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
     }
     func transitionRight(view:UIView) {
     UIView.transition(with: view, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
     }
    func setWordAndTranslateWithAnimation(indexPath:IndexPath){
        let cell = wordsTableView2.cellForRow(at: indexPath) as! WordInTheAppCell
        if(indexPathOfMyTable[indexPath.row].turnOn == false)
        {
            cell.wordLbl2.text = selectedGroup2!.wordsArrayPhone[indexPath.row].translate
            indexPathOfMyTable[indexPath.row].turnOn = true
            transitionRight(view: cell.viewMove2)
        }else{
            cell.wordLbl2.text = selectedGroup2!.wordsArrayPhone[indexPath.row].word
            indexPathOfMyTable[indexPath.row].turnOn = false
            transitionLeft(view: cell.viewMove2)
        }
    }
}

//Creamos una extension de la clase mywordsVC para crear lo de la tableView
extension WordsLoadInTheAppVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedGroup2!.wordsArrayPhone.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //creamos una constante que hace refernecia al diseño de la table
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellAppWords") as? WordInTheAppCell else {return UITableViewCell() }
            let word = selectedGroup2!.wordsArrayPhone[indexPath.row]
        
            cell.wordLbl2.text = word.word
        cell.viewMove2.addTarget(self, action: #selector(viewTapped(_:)), for: .touchUpInside)
        indexPathOfMyTable.append(IndexAndStatus(index: indexPath.row, turnOn: false))
            return cell

    }
    
    @IBAction func viewTapped(_ view:UIView){
        if let indexPath = self.wordsTableView2.indexPathForView(view) {
            setWordAndTranslateWithAnimation(indexPath: indexPath)
        }
    }
    //para que no se pueda seleccionar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         setWordAndTranslateWithAnimation(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
