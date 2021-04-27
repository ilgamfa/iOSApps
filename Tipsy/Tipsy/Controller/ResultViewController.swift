//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ильгам Ахматдинов on 27.04.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: String?
    var tip: Int?
    var split: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split!) people, with \(tip!)% tip."
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
