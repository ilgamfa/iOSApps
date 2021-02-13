//
//  GreenViewController.swift
//  example
//
//  Created by Ильгам Ахматдинов on 13.02.2021.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func GoToRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
//        navigationController?.popViewController(animated: true)
    }
}
