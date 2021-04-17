//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Ильгам Ахматдинов on 17.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBallView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let answerArr = [#imageLiteral(resourceName: "ball-1"),#imageLiteral(resourceName: "ball-2"),#imageLiteral(resourceName: "ball-5"),#imageLiteral(resourceName: "ball-4"),#imageLiteral(resourceName: "ball-5")]
    @IBAction func AnswerAction(_ sender: Any) {
        imageBallView.image = answerArr[Int.random(in: 0...4)]
    }
    
}

