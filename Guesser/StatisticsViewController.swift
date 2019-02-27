//
//  StatisticsViewController.swift
//  Guesser
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var stdDevLBL: UILabel!
    @IBOutlet weak var maxLBL: UILabel!
    @IBAction func clearStatisticsBTN(_ sender: Any) {
        meanLBL.text = "0"
        minLBL.text = "0"
        maxLBL.text = "0"
        stdDevLBL.text = "0"
        Guesser.shared.clearStatistics()
    }
    @IBOutlet weak var meanLBL: UILabel!
    @IBOutlet weak var minLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        updateLabels()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateLabels(){
        minLBL.text = String(Guesser.shared.minimumNumAttempts())
        maxLBL.text = String(Guesser.shared.maximumNumAttempts())
        var count = 0
        for i in 0..<Guesser.shared.numGuesses(){
            count += Guesser.shared.guess(index: i).numAttemptsRequired
        }
        let mean = Double(count)/Double(Guesser.shared.numGuesses())
        meanLBL.text = "\(mean)"
        var stdDevSum = 0.0
        for i in 0..<Guesser.shared.numGuesses(){
            stdDevSum += pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - mean, 2)
        }
        stdDevLBL.text = "\(stdDevSum/Double(Guesser.shared.numGuesses()))"
    }

}
