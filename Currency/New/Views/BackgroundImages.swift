//
//  BackgroundImages.swift
//  Currency
//
//  Created by Юрий Кручинин on 24/10/23.
//

import SwiftUI

struct BackgroundImages: View {
    var body: some View {
        ZStack {
            Image(systemName: "dollarsign.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .position(x: 5, y: 100)
                .foregroundColor(.green)
            
            Image(systemName: "yensign.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .position(x: 90, y: 780)
                .foregroundColor(.green)
            
            Image(systemName: "sterlingsign.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
                .position(x: 390, y: 40)
                .foregroundColor(.green)
            
            Image(systemName: "francsign")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .position(x: 350, y: 350)
                .foregroundColor(.green)
            
            
            Image(systemName: "rublesign.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .position(x: 20, y: 370)
                .foregroundColor(.green)
            
            Image(systemName: "eurosign")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 170, height: 170)
                .position(x: 340, y: 500)
                .foregroundColor(.green)
            
            
//            Text("🤑")
//                .font(.system(size: 75))
//                .position(x: 330, y: 200)
//                
//            
//            Text("🤑")
//                .font(.system(size: 75))
//                .position(x: 20, y: 600)
//            
//            Text("🤑")
//                .font(.system(size: 75))
//                .position(x: 360, y: 730)
        }
    }
}

struct BackgroundImages_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImages()
    }
}
