//
//  ConvertationModel.swift
//  Currency
//
//  Created by Юрий Кручинин on 28/8/23.
//

import SwiftUI

struct ConvertationModel {
    
 var result: String = ""
    
    mutating func convertation(_ chosenCurrency: Double,_ dollarAmount: Double) {
        
        let result = dollarAmount * chosenCurrency
        
        self.result = String(result)
        
    }
    
    mutating func refresh() {
        
        self.result = ""
        
    }
    
}
