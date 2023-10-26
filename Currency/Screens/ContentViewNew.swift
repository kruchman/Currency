//
//  ContentViewNew.swift
//  Currency
//
//  Created by Юрий Кручинин on 23/10/23.
//

import SwiftUI

struct ContentViewNew: View {
    
    @StateObject private var viewModel = ContentViewModel(netwokManager: NetworkManager())
    
    var body: some View {
        ZStack {
            Color("Scroll Background Color")
                .ignoresSafeArea()
            
            BackgroundImages()

            VStack {
                
                Spacer()
                
                VStack {
                    Text(viewModel.isfirstCurrencySelected ? "Choose Second Currency " : "Choose First Currency")
                        .font(.title)
                    
                    ScrollView {
                        VStack {
                            ForEach(viewModel.actualRates.sorted(by: { $0.key < $1.key }), id: \.key) { currency, rate in
                                Button {
                                    viewModel.refreshResults()
                                    if viewModel.isfirstCurrencySelected == false {
                                        viewModel.firstCurrency = currency
                                        viewModel.firstRate = rate
                                        viewModel.isfirstCurrencySelected = true
                                        viewModel.updateLabel()
                                    } else {
                                        viewModel.secondCurrency = currency
                                        viewModel.secondRate = rate
                                        viewModel.isSecondCurrencySelected = true
                                        viewModel.updateLabel()
                                    }
                                } label: {
                                    Text("\(currency)")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor((.black))
                                        .frame(width: 170,height: 50)
                                        .background(Color("Button Color"))
                                        .cornerRadius(10)
                                }
                                
                            }
                        }.padding(.vertical)
                    }
                    .frame(width: 170, height: 350)
                    .background(Color("Scroll Background Color"))
                    .cornerRadius(8)
                }
                
                Spacer()
                
                TextField("Type some amount", text: $viewModel.moneyAmount)
                    .frame(width: 200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    Text(viewModel.labelOfConvertation)
                        .font(.title2)
                    
                    ConvertButton(viewModel: viewModel)

                    Text("Result:")
                        .font(.system(size: 25, weight: .medium))
                    
                    Text(viewModel.resultOfConvertation)
                        .font(.system(size: 27, weight: .bold))
                }
                
                Spacer()
                
                    .onAppear {
                        viewModel.getActualRates()
                    }
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct ContentViewNew_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNew()
    }
}
