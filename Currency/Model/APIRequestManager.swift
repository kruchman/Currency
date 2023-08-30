//
//  APIRequestManager.swift
//  Currency
//
//  Created by Юрий Кручинин on 25/8/23.
//

import SwiftUI

struct APIRequestManager {
    
    private let urlString = "https://openexchangerates.org/api/latest.json?app_id=33c98a93f8a7465891026ef494c453e2#"
    
    func fetchData(completion: @escaping ([String: Double]) -> Void) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data \(error)")
                
                return
            }
            guard let safeData = data else {

                return
            }

            if let currency = self.parseJSON(safeData) {

                completion(currency)
                
            }
        }
        .resume()
 
    }
    
    
    private func parseJSON(_ currencyData: Data) -> [String:Double]? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            let ChosenCurrency = decodedData.rates
            return ChosenCurrency
        } catch {
            print("Error parsing data \(error)")
            return nil
        }
        
    }
    
}
