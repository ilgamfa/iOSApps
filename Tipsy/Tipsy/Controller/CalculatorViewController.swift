//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Ильгам Ахматдинов on 27.04.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTheTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTheTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected =  true
        
        let buttonTitle = sender.currentTitle!
//        let minusPercentSign = String(buttonTitle.dropLast())
//        let titleAsNumber = Double(minusPercentSign)!
//        tip = titleAsNumber / 100
        tip = calculatorBrain.getTip(buttonTitle: buttonTitle)
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTheTextField.text!
//        finalResult = calculatorBrain.getResult(bill: bill)
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }


    
}
