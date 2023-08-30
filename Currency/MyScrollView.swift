//
//  ScrollView.swift
//  Currency
//
//  Created by Юрий Кручинин on 25/8/23.
//

import SwiftUI

struct MyScrollView: View {
    
    @Binding var currencyData: [String: Double]
    @Binding var chosenCurrency: String
    @Binding var chosenRate: Double
    @Binding var convertationModel: ConvertationModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 3) {
                ForEach(currencyData.sorted(by: { $0.key < $1.key }), id: \.key) { currency, rate in
                    Button( action: {
                        convertationModel.refresh()
                        chosenCurrency = currency
                        chosenRate = rate
                    }) {
                        Text("\(currency): \(String(format:"%.2f",rate))")
                            .frame(width: 200, height: 40)
                            .foregroundColor(.black)
                            .border(Color.black, width: 1)
                    }
                }
            }
        }
        .frame(maxHeight: 300)
        .border(Color.gray, width: 2)
        .shadow(radius: 5)
    }
        }


struct MyScrollView_Previews: PreviewProvider {
    static var previews: some View {
        let currencyData: [String: Double] = [
            "EUR": 0.85,
            "GBP": 0.72,
            "JPY": 110.2
        ]
        let chosenCurrency = "EUR"
        let chosenRate = 0.85
        let convertationModel = ConvertationModel()

        return MyScrollView(currencyData: .constant(currencyData), chosenCurrency: .constant(chosenCurrency), chosenRate: .constant(chosenRate), convertationModel: .constant(convertationModel))
    }
}
