//
//  FirstViewController.swift
//  Guesser
//
//  Created by Student on 2/26/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {

    @IBOutlet weak var myGuessTF: UITextField!
    
    @IBOutlet weak var guessLBL: UILabel!
    @IBAction func amIRightBTN(_ sender: Any) {
        if let value = Int(myGuessTF.text!) {
            let result = Guesser.shared.amIRight(guess: Int(value))
            if result == Result.correct{
                guessLBL.text = result.rawValue
                displayMessage()
                Guesser.shared.createNewProblem()
            }else{
                guessLBL.text = result.rawValue
            }
        }else{
            invalidMessage()
        }
    }
    
    @IBAction func newProblemBTN(_ sender: Any) {
        guessLBL.text = ""
        myGuessTF.text = ""
        Guesser.shared.createNewProblem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Guesser.shared.createNewProblem()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) attempts",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func invalidMessage(){
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "You have entered an invalid input. Please enter a value from range 1-10",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

