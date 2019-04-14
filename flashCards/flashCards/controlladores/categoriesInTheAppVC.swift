//
//  categoriesInTheAppVC.swift
//  flashCards
//
//  Created by Misael Rivera on 12/9/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class categoriesInTheAppVC: UIViewController {
    

    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var groupsInMyAppTV:UITableView!
 
    
    let allMyWords = QuestionBank()
    let myColors = [#colorLiteral(red: 0.1978170276, green: 0.6105838418, blue: 0.9814348817, alpha: 1),#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4666666667, green: 0.5333333333, blue: 0.6, alpha: 1)]
    //variable para el grupo seleccionado el cual lo mandamos a la siguiente vista
    var selectedGroup:WordsBankStruck!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsInMyAppTV.delegate = self
        groupsInMyAppTV.dataSource = self
        notification()
      
    }
    @IBAction func botonPlayBtnWasPressed(_ button: UIButton){
        
        if let indexPath = self.groupsInMyAppTV.indexPathForView(button) {
            selectedGroup = allMyWords.bank[indexPath.section].bankoWords![indexPath.row]
            performSegue(withIdentifier: "playWords", sender: self)
        }
        else {
            print("Button indexPath not found")
        }
    }
    func notification() {
        let contenido = UNMutableNotificationContent()
        contenido.title = "FlashCard memorycard 🥳"
        contenido.subtitle = "Aprende nuevas palabras hoy 🏅"
        contenido.body = "Solo estudia una categoria por 5 minutos y aprende 15 palabras 😎"
        var date = DateComponents()
        date.hour = 20
        date.minute = 00
        date.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let respuesta = UNNotificationRequest(identifier: "any", content: contenido, trigger: trigger)
        UNUserNotificationCenter.current().add(respuesta, withCompletionHandler: nil)
    }
        
}
extension categoriesInTheAppVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return allMyWords.bank[section].bankoWords!.count
    return allMyWords.bank[section].bankoWords!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupInTheApp", for: indexPath) as? GroupInTheAppCell else { return UITableViewCell() }
        cell.texto?.text = allMyWords.bank[indexPath.section].bankoWords![indexPath.row].section
        let color = myColors[indexPath.section]
        cell.vistaColor.backgroundColor = color
        cell.BotonPlay.setTitleColor(color, for: .normal)
        cell.BotonPlay.addTarget(self, action: #selector(botonPlayBtnWasPressed(_:)), for: .touchUpInside)
        //sectionsObject[indexPath.section].sectionWords[indexPath.row]
        return cell
     
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return allMyWords.bank[section].seccion
        //sectionsObject[section].sectionName
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return allMyWords.bank.count
            //sectionsObject.count
    }
    //creamos codigo para poder entrar a la siguiente vista y me muestre lo que necesito ver
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowAppWords", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //preparamos la siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let wordsVC = segue.destination as? WordsLoadInTheAppVC {
            if let indexPath = groupsInMyAppTV.indexPathForSelectedRow {
                wordsVC.selectedGroup2 = allMyWords.bank[indexPath.section].bankoWords![indexPath.row]
            }
        }
        else if let playInPhoneVC = segue.destination as? gameVC {
                playInPhoneVC.wordsForLearn = selectedGroup
            
        }
    }
}

