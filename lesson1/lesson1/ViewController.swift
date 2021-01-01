//
//  ViewController.swift
//  lesson1
//
//  Created by Ильгам Ахматдинов on 29.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
   
    var touches = 0{
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    
    func flibButton(emoji:String, button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5032429099, blue: 0.9042389989, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    let emojiCollection = ["🦊", "🐰", "🦊", "🐰"]
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if  let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            flibButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

