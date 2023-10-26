//
//  APIRequestManager.swift
//  Currency
//
//  Created by Юрий Кручинин on 25/8/23.
//

import SwiftUI

protocol Networking {
    func fetchData(completion: @escaping (Result<[String: Double], Error>) -> Void)
}

struct NetworkManager: Networking {
    
    private let urlString = "https://openexchangerates.org/api/latest.json?app_id=33c98a93f8a7465891026ef494c453e2#"
    
    func fetchData(completion: @escaping (Result<[String: Double], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(Errors.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(Errors.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(Errors.invalidResponse))
                return
            }
            guard let safeData = data else {
                completion(.failure(Errors.invalidData))
                return
            }
            if let currency = parseJSON(safeData) {
                completion(.success(currency))
            }
        }
        .resume()
        
    }
}

private func parseJSON(_ currencyData: Data) -> [String:Double]? {
    
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
        let rates = decodedData.rates
        return rates
    } catch {
        print("Error parsing data \(error)")
        return nil
    }
}

struct MockNetworkManager: Networking {
    func fetchData(completion: @escaping (Result<[String : Double], Error>) -> Void) {
        let response = MockData.sampleCurrency.rates
        completion(.success(response))
    }
}

