//
//  ViewModel.swift
//  Currency
//
//  Created by Юрий Кручинин on 23/10/23.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    
    private let networkManager: Networking
    init(netwokManager: Networking) {
        self.networkManager = netwokManager
    }
    
    private let convertationModel = ConvertationModel()
    
    @Published var isLoading: Bool = false
    
    @Published var actualRates: [String:Double] = ["": 0.0]
    
    @Published var isfirstCurrencySelected = false
    @Published var isSecondCurrencySelected = false
    @Published var firstCurrency: String = ""
    @Published var secondCurrency: String = ""
    @Published var firstRate:Double = 0.0
    @Published var secondRate: Double = 0.0
    
    @Published var moneyAmount: String = ""
    
    @Published var resultOfConvertation: String = ""
    @Published var labelOfConvertation: String = ""
    
    func getActualRates() {
        isLoading = true
        networkManager.fetchData { rates in
            switch rates {
            case .success(let rates):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.actualRates = rates
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateLabel() {
        if  isfirstCurrencySelected && isSecondCurrencySelected == false {
            labelOfConvertation = "\(firstCurrency) to ..."
        } else if  isfirstCurrencySelected && isSecondCurrencySelected {
            labelOfConvertation = "\(firstCurrency) to \(secondCurrency)"
        } 
    }
    
    func convert() {
        guard moneyAmount.isValidNumber else {
            labelOfConvertation = "Enter some positive number"
            return
        }
        if !firstCurrency.isEmpty && !secondCurrency.isEmpty {
            resultOfConvertation = convertationModel.convertation(firstRate, secondRate, Double(moneyAmount) ?? 0.0)
        }
        refreshData()
    }
    
    func refreshData() {
        isfirstCurrencySelected = false
        isSecondCurrencySelected = false
        firstCurrency = ""
        secondCurrency = ""
        firstRate = 0.0
        secondRate = 0.0
        moneyAmount = ""
    }
    
    func refreshResults() {
        resultOfConvertation = ""
        labelOfConvertation = ""
    }
    
}


