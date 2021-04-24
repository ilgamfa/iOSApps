//
//  AnotherViewController.swift
//  Destini
//
//  Created by Ильгам Ахматдинов on 25.04.2021.
//

import UIKit


class AnotherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToStartViewButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
