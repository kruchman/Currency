//
//  ContentView.swift
//  Currency
//
//  Created by Юрий Кручинин on 25/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currencyData: [String: Double] = [:]
    @State private var dollarAmount: String = ""
    @State private var chosenCurrency: String = ""
    @State private var chosenRate: Double = 0.0
    @State private var convertationModel = ConvertationModel()
    
    
    var body: some View {
        
        ZStack {
            
            Image("back")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("Select Currency")
                        .font(Font.headline)
                    
                    MyScrollView(currencyData: $currencyData, chosenCurrency: $chosenCurrency, chosenRate: $chosenRate, convertationModel: $convertationModel)
                }
                .offset(y: -50)
                
                
                VStack {
                    HStack{
                        TextField("Type amount of $", text: $dollarAmount)
                            .frame(width: 200)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                        .border(Color.black)
                        
                        Text("$")
                    }
                    Button("Convert") {
                        if let dollarAmountDouble = Double(dollarAmount),
                           let chosenRate = currencyData[chosenCurrency] {
                            let result = dollarAmountDouble * chosenRate
                            let formattedResult = String(format: "%.2f", result)
                            convertationModel.result = String(formattedResult)
                        }
                    }
                    .offset(y: 25)
                    .font(Font.system(size: 25))
                    
                    Text("Result: \(convertationModel.result) \(chosenCurrency)")
                        .offset(y: 50)
                        .font(Font.system(size: 20))
                }
                .offset(y: 50)
            }
            .onAppear {
                fetchCurrencyData()
                _ = Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { _ in
                    fetchCurrencyData()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    func fetchCurrencyData() {
        APIRequestManager().fetchData { currencyData in
            self.currencyData = currencyData
        }
    }
    
}
