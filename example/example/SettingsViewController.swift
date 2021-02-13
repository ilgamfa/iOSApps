//
//  SettingsViewController.swift
//  example
//
//  Created by Ильгам Ахматдинов on 13.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func GoToGreen(_ sender: UIButton) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "GreenViewController")
        navigationController?.pushViewController(newVC!, animated: true)
        
    }
}
