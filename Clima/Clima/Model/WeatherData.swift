//
//  WeatherData.swift
//  Clima
//
//  Created by Ильгам Ахматдинов on 03.05.2021.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
