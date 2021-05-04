//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Ильгам Ахматдинов on 04.05.2021.
//

import Foundation

struct CoinModel {
    let rate: Double
    
    var rateString: String {
        String(format: "%.1f", rate)
    }
}
