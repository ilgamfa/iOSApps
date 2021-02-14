//
//  SettingsViewController.swift
//  example
//
//  Created by Ильгам Ахматдинов on 13.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGreen"{
            let text = textField.text
            let newVC = segue.destination as! GreenViewController
            newVC.textFromVC = text
        }
    }
    
//    @IBAction func GoToGreen(_ sender: UIButton) {
//        let newVC = storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as! GreenViewController
//        let text = textField.text
//        newVC.textFromVC = text
//        navigationController?.pushViewController(newVC, animated: true)
//
//    }
}
