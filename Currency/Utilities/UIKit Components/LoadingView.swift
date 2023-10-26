//
//  LoadingView.swift
//  Currency
//
//  Created by Юрий Кручинин on 24/10/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
//        activityIndicatorView.color = UIColor(named: "Scroll Background Color")
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color("Scroll Background Color")
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}
