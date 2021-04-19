//
//  ViewController.swift
//  Xylophone
//
//  Created by Ильгам Ахматдинов on 19.04.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard var keyTapped = sender.currentTitle else { return }
        playSound(resource: keyTapped, withExtension: "wav")
        
         
    }
    
    func playSound(resource: String, withExtension: String) {
        let url = Bundle.main.url(forResource: resource, withExtension: withExtension)
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    
    }
}
