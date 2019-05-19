//
//  statisticsVC.swift
//  flashCards
//
//  Created by misael rivera on 16/09/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import Charts

class statisticsVC: UIViewController {

    @IBOutlet weak var linechartView: PieChartView!
    
    var wordsSkip = PieChartDataEntry(value: 0)
    var wordsIncorrect = PieChartDataEntry(value: 0)
    var wordsCorrect = PieChartDataEntry(value: 0)
    
    var numberOflearned = [PieChartDataEntry]()
    
    @IBOutlet weak var labelStatistics: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var learnedLabel: UILabel!
    @IBOutlet weak var studyingLevel: UILabel!
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linechartView.chartDescription?.text = "Tus estadisticas"
        linechartView.centerText = "Mis palabras"
       
        wordsSkip.label = "Saltadas"
        wordsCorrect.label = "Correctas"
        wordsIncorrect.label = "Incorrectas"
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let wordsSkiped:Int = UserDefaults.standard.integer(forKey: "skip")
        let learned:Int = UserDefaults.standard.integer(forKey: "learned")
        let correct:Int = UserDefaults.standard.integer(forKey: "correct")
        let incorrect:Int = UserDefaults.standard.integer(forKey: "incorrect")
        let totalWords:Int = UserDefaults.standard.integer(forKey: "totalWords")
        let mylevel = UserDefaults.standard.integer(forKey: "yourLevel")
        
        levelLabel.text = "Level \(mylevel)"
        learnedLabel.text = String(learned)
        studyingLevel.text = String(totalWords)
        if wordsSkiped != 0 {
            wordsSkip.value = Double(wordsSkiped)
        }
        if correct != 0 {
            wordsCorrect.value = Double(correct)
        }
        if incorrect != 0 {
            wordsIncorrect.value = Double(incorrect)
        }
        if wordsSkiped != 0 || correct != 0 || incorrect != 0 {
            linechartView.isHidden = false
            labelStatistics.isHidden = true
            numberOflearned = [wordsSkip,wordsIncorrect,wordsCorrect]
            updateChartData()
        } else{
            linechartView.isHidden = true
            labelStatistics.isHidden = false
        }
    }
    @objc private func handleTop() {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.6
        
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    func updateChartData() {
        let chartDataSet = PieChartDataSet(values: numberOflearned, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [#colorLiteral(red: 0.1254901961, green: 0.6980392157, blue: 0.6666666667, alpha: 1) ,  #colorLiteral(red: 0.9019607843, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1) ]
        chartDataSet.colors = colors 
        linechartView.data = chartData
        
    }
    
    @IBAction func actionBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
