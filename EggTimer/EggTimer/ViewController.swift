//
//  ViewController.swift
//  EggTimer
//
//  Created by Ильгам Ахматдинов on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func eddSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}

