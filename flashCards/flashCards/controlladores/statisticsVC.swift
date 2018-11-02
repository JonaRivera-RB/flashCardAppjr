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
    
    var wordsLearned = PieChartDataEntry(value: 0)
    var wordsIncorrect = PieChartDataEntry(value: 0)
    var wordsCorrect = PieChartDataEntry(value: 0)
    
    var numberOflearned = [PieChartDataEntry]()
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linechartView.chartDescription?.text = "Your statistics"
        linechartView.centerText = "My words"
        let learnedWords:Int = UserDefaults.standard.integer(forKey: "learned")
        
        if learnedWords != 0 {
            wordsLearned.value = Double(learnedWords)
        }
        
        wordsCorrect.value = 30.0
        wordsCorrect.label = "Correct"
        
        wordsIncorrect.value = 40.0
        wordsIncorrect.label = "Incorrect"
        
        numberOflearned = [wordsLearned,wordsIncorrect,wordsCorrect]
        updateChartData()
        
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
        
        let colors = [#colorLiteral(red: 0.2039215686, green: 0.2862745098, blue: 0.3529411765, alpha: 1) , #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
        chartDataSet.colors = colors 
        linechartView.data = chartData
        
    }
    
    @IBAction func actionBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
