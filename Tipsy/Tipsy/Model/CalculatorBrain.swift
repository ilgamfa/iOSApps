//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Ильгам Ахматдинов on 28.04.2021.
//

import Foundation

struct CalculatorBrain {
    var resultFF: Result?
    
    func getTip(buttonTitle: String) -> Double {
        let minusPercentSign = String(buttonTitle.dropLast())
        let titleAsNumber = Double(minusPercentSign)!
        let tip = titleAsNumber / 100
        return tip
    }
}
