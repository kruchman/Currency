//
//  ConvertationModel.swift
//  Currency
//
//  Created by Юрий Кручинин on 28/8/23.
//

import SwiftUI

struct ConvertationModel {
    func convertation(_ firstCurrency: Double,_ secondCurrency: Double,_ amount: Double) -> String {
        let result = amount / firstCurrency * secondCurrency
        let formattedResult = String(format: "%.2f", result)
        return formattedResult
    }
    
}
