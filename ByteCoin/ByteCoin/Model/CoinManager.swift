//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Ильгам Ахматдинов on 03.05.2021.
//

import Foundation


protocol CoinManagerDelegate {
    func didUpdateRate(rate: String, currency: String)
    func didFailWithError(error: Error)
}


struct CoinManager {

    let baseURl = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "B6DB7D2C-ED7F-44D5-885E-432435C9716C"
    
    var currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    
    
    func getCoinPrice(for currency: String) {
        
        let urlString = "\(baseURl)/\(currency)/?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let btcPrice = self.parseJSON(safeData) {
                        let rateString = String(format: "%.2f", btcPrice)
                        self.delegate?.didUpdateRate(rate: rateString, currency: currency)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
            
        } catch {
            print(error)
            return nil
        }
    }
}
