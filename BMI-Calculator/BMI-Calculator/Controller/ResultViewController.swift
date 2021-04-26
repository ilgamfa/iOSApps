//
//  ResultViewController.swift
//  BMI-Calculator
//
//  Created by Ильгам Ахматдинов on 26.04.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var color: UIColor?
    var advice: String?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    
    }
    

    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
