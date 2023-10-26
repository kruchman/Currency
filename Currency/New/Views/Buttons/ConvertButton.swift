//
//  ConvertButton.swift
//  Currency
//
//  Created by Юрий Кручинин on 23/10/23.
//

import SwiftUI

struct ConvertButton: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        Button {
            viewModel.convert()
        } label: {
            Label("Convert", systemImage: "banknote.fill")
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
        .tint(.green)
    }
}

struct ConvertButton_Previews: PreviewProvider {
    static var previews: some View {
        ConvertButton(viewModel: ContentViewModel(netwokManager: NetworkManager()))
    }
}
