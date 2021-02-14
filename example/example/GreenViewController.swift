//
//  GreenViewController.swift
//  example
//
//  Created by Ильгам Ахматдинов on 13.02.2021.
//

import UIKit

class GreenViewController: UIViewController {
    var textFromVC:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = textFromVC
    }
    
    @IBAction func GoToRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
//        navigationController?.popViewController(animated: true)
    }
}
