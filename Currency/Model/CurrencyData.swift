//
//  CurrencyData.swift
//  Currency
//
//  Created by Юрий Кручинин on 25/8/23.
//

import Foundation

struct CurrencyData: Codable {
    
    let disclaimer: String
    let license: String
    let timestamp: Int
    let base: String
    let rates: [String:Double]
    
}
