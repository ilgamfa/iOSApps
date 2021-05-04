//
//  CoinData.swift
//  ByteCoin
//
//  Created by Ильгам Ахматдинов on 04.05.2021.
//

import Foundation

struct CoinData: Codable {
    let rate: Double
    var rateString: String {
        String(format: "%.2f", rate)
    }
}
