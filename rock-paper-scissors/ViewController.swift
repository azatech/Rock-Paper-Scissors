//
//  ViewController.swift
//  rock-paper-scissors
//
//  Created by Azat IOS on 28.11.2017.
//  Copyright © 2017 Azat IOS. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var opponentLabel: UILabel!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var opponentsScore: UILabel!
    @IBOutlet weak var chosenLbl: UILabel!

    // vars for score labels
    var me = 0
    var opponent = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // beginning the app
        myScore.text = String(me)
        opponentsScore.text = String(opponent)
        opponentLabel.text = "Choose something!"
        
    }
    // random number
    var a = Int()
    var randomNumber = Int()
    func randomChoice() {
        randomNumber = Int(arc4random() % 3 )
        print("randomNumber is \(randomNumber)")
    }
    // Round
    func gameOn() {
        switch(randomNumber) {
        case 0:
            chosenLbl.text = "I chose Rock!"
            if a == 0 {
            alertFunction(title: "It's Draw!")
                me += 1
                opponent += 1
                hideLabel()
            } else {
                if a == 1 {
                    alertFunction(title: "You won :)")
                    opponentLabel.text = "U R LUCKY!"
                    me += 1
                }
                if a == 2 {
                    alertFunction(title: "You Lost !")
                    opponentLabel.text = "HA-HA! U LOOSER"
                    opponent += 1
                }
            }
            break
        case 1:
            chosenLbl.text = "I chose Paper!"
            if a == 0 {
                alertFunction(title: "You Lost !")
                opponentLabel.text = "U LOOSER"
                opponent += 1
            } else {
                if a == 1 {
                    alertFunction(title: "It's Draw!")
                    hideLabel()
                    me += 1
                    opponent += 1
                }
                if a == 2 {
                    alertFunction(title: "You won :)")
                    opponentLabel.text = "NOT MY DAY"
                    me += 1
                }
            }
            break
        case 2:
            chosenLbl.text = "I chose Scissors!"
            if a == 0 {
                alertFunction(title: "You won :)")
                opponentLabel.text = "NOT MY DAY"
                me += 1
            } else {
                if a == 1 {
                    alertFunction(title: "You Lost!")
                    opponentLabel.text = "I AM AWESOME"
                    opponent += 1
                }
                if a == 2 {
                    alertFunction(title: "It's Draw!")
                    hideLabel()
                    me += 1
                    opponent += 1
                }
            }
            break default: break
        }
    }
    func hideLabel() {
        opponentLabel.isHidden = true
    }
    func unHideLabel(){
        opponentLabel.isHidden = false
    }
    // Update score Labels
    func rightScore() {
        opponentsScore.text = String(opponent)
        myScore.text = String(me)
    }
    // Alert function with result
    func alertFunction(title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    // Apps logic
    func allCycle(chooseInt: Int) {
        a = chooseInt
        randomChoice()
        unHideLabel()
        gameOn()
        rightScore()
    }

    @IBAction func rockActionBtn(_ sender: UIButton) {
        allCycle(chooseInt: 0)
    }
    @IBAction func paperActionBtn(_ sender: UIButton) {
        allCycle(chooseInt: 1)
    }
    @IBAction func scissorsActionBtn(_ sender: UIButton) {
        allCycle(chooseInt: 2)
    }
}
