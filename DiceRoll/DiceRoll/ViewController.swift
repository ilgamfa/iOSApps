//
//  ViewController.swift
//  DiceRoll
//
//  Created by Ильгам Ахматдинов on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceView: UIImageView!
    @IBOutlet weak var rightDiceView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let diceArr = [#imageLiteral(resourceName: "diceOne"), #imageLiteral(resourceName: "diceTwo"), #imageLiteral(resourceName: "diceThree"), #imageLiteral(resourceName: "diceFour"), #imageLiteral(resourceName: "diceFive"), #imageLiteral(resourceName: "diceSix")]

    @IBAction func rollAction(_ sender: Any) {
        leftDiceView.image = diceArr[Int.random(in: 0...5)]
        rightDiceView.image = diceArr[Int.random(in: 0...5)]
    }
    
    
    
}

